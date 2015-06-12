class Message < ActiveRecord::Base
	belongs_to :user_account
	belongs_to :post_sell
end
