class AddAccount < ActiveRecord::Migration
  def change
  	add_column  :accounts, :secret_token, :string
  end
end
