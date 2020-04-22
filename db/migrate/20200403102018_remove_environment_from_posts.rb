# frozen_string_literal: true

class RemoveEnvironmentFromPosts < ActiveRecord::Migration[5.0]
  def up
    remove_column :posts, :environment
      end

  def down
    add_column :posts, :environment, :string
  end
end
