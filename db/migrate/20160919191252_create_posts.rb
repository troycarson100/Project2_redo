class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :embed
      t.integer :vote

      t.timestamps null: false
    end
  end
end
