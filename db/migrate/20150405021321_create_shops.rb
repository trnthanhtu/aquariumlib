class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string  :name
      t.string  :address
      t.text    :description
      t.string  :person
      t.integer :phone_number
      t.string  :image
      t.string  :website
      t.boolean :delete_flag
      t.timestamps null: false
    end
  end
end
