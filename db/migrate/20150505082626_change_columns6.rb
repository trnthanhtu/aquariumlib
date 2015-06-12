class ChangeColumns6 < ActiveRecord::Migration
  def change
  	add_column  :messages, :admin, :boolean
  end
end
