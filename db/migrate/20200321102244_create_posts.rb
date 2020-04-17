# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :store_name
      t.string :address
      t.string :image
      t.string :environment
      t.string :evaluation
      t.string :time_start
      t.string :time_end
      t.integer :address_prefectures
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :posts, %i[user_id created_at]
  end
end
