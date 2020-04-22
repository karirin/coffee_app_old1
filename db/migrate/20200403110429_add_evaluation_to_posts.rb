# frozen_string_literal: true

class AddEvaluationToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :evaluation1, :string
    add_column :posts, :evaluation2, :string
    add_column :posts, :evaluation3, :string
    add_column :posts, :evaluation4, :string
    add_column :posts, :evaluation5, :string
  end
end
