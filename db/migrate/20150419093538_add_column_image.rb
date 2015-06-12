class AddColumnImage < ActiveRecord::Migration
  def change
  	add_column :plant_images, :image, :string
  end
end
