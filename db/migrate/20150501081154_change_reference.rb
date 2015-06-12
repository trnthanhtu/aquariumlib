class ChangeReference < ActiveRecord::Migration
  def change
  	remove_reference :post_sells, :account, index: true
  	# add_reference :post_sells, :user_accounts, index: true
  end
end
