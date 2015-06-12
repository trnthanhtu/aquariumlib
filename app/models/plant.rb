class Plant < ActiveRecord::Base
  belongs_to :category
  has_many :plant_images
  belongs_to :technical

  accepts_nested_attributes_for :plant_images

  validates :technical, :category, presence: true

end