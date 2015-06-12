class RemoveDelete < ActiveRecord::Migration
  def change
  	remove_column :technicals, :delete_flag , :boolean
  	remove_column :plants, :delete_flag , :boolean
  	remove_column :plant_images, :delete_flag , :boolean
  	remove_column :shops, :delete_flag , :boolean
  	remove_column :posts, :delete_flag , :boolean
  	remove_column :accounts, :delete_flag , :boolean
  	remove_column :post_sells, :delete_flag , :boolean
  	remove_column :categories, :delete_flag , :boolean
  	remove_column :contacts, :delete_flag , :boolean
  	remove_column :roles, :delete_flag , :boolean
  	remove_column :accounts_roles, :delete_flag , :boolean

  	# Add new column to Plants
  	add_column :plants, :genus, :string
  	add_column :plants, :Familia, :string
  end
end
