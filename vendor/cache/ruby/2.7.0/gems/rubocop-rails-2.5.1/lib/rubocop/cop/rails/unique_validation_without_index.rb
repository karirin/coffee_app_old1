# frozen_string_literal: true

module RuboCop
  module Cop
    module Rails
      # When you define a uniqueness validation in Active Record model,
      # you also should add a unique index for the column. There are two reasons
      # First, duplicated records may occur even if Active Record's validation
      # is defined.
      # Second, it will cause slow queries. The validation executes a `SELECT`
      # statement with the target column when inserting/updating a record.
      # If the column does not have an index and the table is large,
      # the query will be heavy.
      #
      # Note that the cop does nothing if db/schema.rb does not exist.
      #
      # @example
      #   # bad - if the schema does not have a unique index
      #   validates :account, uniqueness: true
      #
      #   # good - if the schema has a unique index
      #   validates :account, uniqueness: true
      #
      #   # good - even if the schema does not have a unique index
      #   validates :account, length: { minimum: MIN_LENGTH }
      #
      class UniqueValidationWithoutIndex < Cop
        include ActiveRecordHelper

        MSG = 'Uniqueness validation should be with a unique index.'

        def on_send(node)
          return unless node.method?(:validates)
          return unless uniqueness_part(node)
          return if condition_part?(node)
          return unless schema
          return if with_index?(node)

          add_offense(node)
        end

        private

        def with_index?(node)
          klass = class_node(node)
          return true unless klass # Skip analysis

          table = schema.table_by(name: table_name(klass))
          return true unless table # Skip analysis if it can't find the table

          names = column_names(node)
          return true unless names

          # Compatibility for Rails 4.2.
          add_indicies = schema.add_indicies_by(table_name: table_name(klass))

          (table.indices + add_indicies).any? do |index|
            index.unique &&
              (index.columns.to_set == names ||
               include_column_names_in_expression_index?(index, names))
          end
        end

        def include_column_names_in_expression_index?(index, column_names)
          return false unless (expression_index = index.expression)

          column_names.all? do |column_name|
            expression_index.include?(column_name)
          end
        end

        def column_names(node)
          arg = node.first_argument
          return unless arg.str_type? || arg.sym_type?

          ret = [arg.value]
          names_from_scope = column_names_from_scope(node)
          ret.concat(names_from_scope) if names_from_scope

          ret.map! do |name|
            klass = class_node(node)
            resolve_relation_into_column(
              name: name.to_s,
              class_node: klass,
              table: schema.table_by(name: table_name(klass))
            )
          end
          ret.include?(nil) ? nil : ret.to_set
        end

        def column_names_from_scope(node)
          uniq = uniqueness_part(node)
          return unless uniq.hash_type?

          scope = find_scope(uniq)
          return unless scope

          case scope.type
          when :sym, :str
            [scope.value]
          when :array
            array_node_to_array(scope)
          end
        end

        def find_scope(pairs)
          pairs.each_pair.find do |pair|
            key = pair.key
            next unless key.sym_type? && key.value == :scope

            break pair.value
          end
        end

        def class_node(node)
          node.each_ancestor.find(&:class_type?)
        end

        def uniqueness_part(node)
          pairs = node.arguments.last
          return unless pairs.hash_type?

          pairs.each_pair.find do |pair|
            next unless pair.key.sym_type? && pair.key.value == :uniqueness

            break pair.value
          end
        end

        def condition_part?(node)
          pairs = node.arguments.last
          return unless pairs.hash_type?

          pairs.each_pair.any? do |pair|
            key = pair.key
            next unless key.sym_type?

            key.value == :if || key.value == :unless
          end
        end

        def array_node_to_array(node)
          node.values.map do |elm|
            case elm.type
            when :str, :sym
              elm.value
            else
              return nil
            end
          end
        end

        def schema
          RuboCop::Rails::SchemaLoader.load(target_ruby_version)
        end
      end
    end
  end
end
