class Post < ActiveRecord::Base
  belongs_to :account

  mount_uploader :image, ImageUploader
end