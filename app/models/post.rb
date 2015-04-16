class Post < ActiveRecord::Base
  belongs_to :plant
  has_many   :ratings

  mount_uploader :image, ImageUploader
end