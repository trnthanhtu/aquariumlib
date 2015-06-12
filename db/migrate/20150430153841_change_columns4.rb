class ChangeColumns4 < ActiveRecord::Migration
  def change
  	add_column  :user_accounts, :phone_number, :string
  	add_column  :user_accounts, :birthday, :datetime

  	remove_column  :accounts, :secret_token, :string

  end
end
