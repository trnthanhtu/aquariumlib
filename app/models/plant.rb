class Plant < ActiveRecord::Base
  belongs_to :category
  has_many :plant_images
  has_many :posts
  has_one  :technical

  accepts_nested_attributes_for :plant_images
  accepts_nested_attributes_for :posts
end