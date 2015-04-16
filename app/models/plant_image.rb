class PlantImage < ActiveRecord::Base
  belongs_to :plant

  mount_uploader :image, ImageUploader
end