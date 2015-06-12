class ChangeReference2 < ActiveRecord::Migration
  def change
  	# remove_reference :post_sells, :user_accounts, index: true
  	add_reference :post_sells, :user_account, index: true
  end
end
