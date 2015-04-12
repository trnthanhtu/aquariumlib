class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :scientic_name
      t.string :vietnamese_name
      t.string :address
      t.text :description
      t.integer :level
      t.string :size
      t.string :address_grow
      t.boolean :delete_flag
      t.timestamps null: false
      t.references :category, index: true
    end
  end
end
