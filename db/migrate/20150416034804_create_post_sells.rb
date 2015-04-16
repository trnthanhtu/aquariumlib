class CreatePostSells < ActiveRecord::Migration
  def change
    create_table :post_sells do |t|
      t.string :title
      t.string :image
      t.string :description
      t.timestamps null: false
      t.boolean :delete_flag
      t.references :account, index: true
    end
  end
end
