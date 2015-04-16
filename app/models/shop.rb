class Shop < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
