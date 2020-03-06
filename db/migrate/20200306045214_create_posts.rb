class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :store_name
      t.string :address
      t.string :image
      t.time :time
      t.string :environment
      t.string :evaluation

      t.timestamps
    end
  end
end
