class ChangeColumns5 < ActiveRecord::Migration
  def change
  	 remove_column  :user_accounts, :sex, :string
     remove_column  :user_accounts, :detail, :string
  end
end
