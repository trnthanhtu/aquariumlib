class CreatePlantImages < ActiveRecord::Migration
  def change
    create_table :plant_images do |t|
      t.string :description
      t.string :name
      t.boolean :delete_flag
      t.timestamps null: false
      t.references :plant, index: true
    end
  end
end
