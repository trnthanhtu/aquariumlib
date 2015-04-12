class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :detail
      t.text :discription
      t.timestamps null: false
      t.boolean :delete_flag
      t.references :plant, index: true
      t.references :type_post, index: true
    end
  end
end
