class ChangeColumns3 < ActiveRecord::Migration
  def change
  	add_column  :post_sells, :type, :string
  end
end
