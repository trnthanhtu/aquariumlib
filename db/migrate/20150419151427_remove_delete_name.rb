class RemoveDeleteName < ActiveRecord::Migration
  def change
  	remove_column :plants, :vietnamese_name , :string
  end
end
