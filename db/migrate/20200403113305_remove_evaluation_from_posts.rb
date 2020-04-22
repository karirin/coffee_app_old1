# frozen_string_literal: true

class RemoveEvaluationFromPosts < ActiveRecord::Migration[5.1]
  def up
    remove_column :posts, :evaluation
      end

  def down
    add_column :posts, :evaluation, :string
  end
end
