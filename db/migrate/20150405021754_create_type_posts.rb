class CreateTypePosts < ActiveRecord::Migration
  def change
    create_table :type_posts do |t|
      t.string :name
      t.text :description
      t.boolean :delete_flag
      t.timestamps null: false
    end
  end
end
