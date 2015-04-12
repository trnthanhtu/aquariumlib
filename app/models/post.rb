class Post < ActiveRecord::Base
  belongs_to :plant
  belongs_to :type_post
  has_many   :ratings
end