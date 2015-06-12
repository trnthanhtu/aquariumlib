class ChangeColumns2 < ActiveRecord::Migration
  def change
  	add_column  :shops, :township, :string
  end
end
