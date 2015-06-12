class ChangColumn < ActiveRecord::Migration
  def change
  	change_column :technicals, :level, :text
  	change_column :technicals, :pH, :text
  	change_column :technicals, :light, :text
  	change_column :technicals, :temperature, :text

  	 add_column  :technicals, :growth, :text
  	 add_column  :technicals, :tree_structure, :text

  	# remove_column :technicals, :address_grow, :boolean

  	rename_column :plants, :Familia, :familia
  end
end
