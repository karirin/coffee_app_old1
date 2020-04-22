# frozen_string_literal: true

class AddEnvironmentToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :wifi, :string
    add_column :posts, :plug, :string
    add_column :posts, :tabacco, :string
    add_column :posts, :card, :string
  end
end
