class PostSell < ActiveRecord::Base
	self.inheritance_column = :foo
	belongs_to :user_account
	has_many :messages

	mount_uploader :image, ImageUploader
end
