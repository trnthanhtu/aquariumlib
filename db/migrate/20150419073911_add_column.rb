class AddColumn < ActiveRecord::Migration
  def change
  	 remove_column :technicals, :address_grow, :string
  	 
  end
end
