class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable

   has_and_belongs_to_many  :roles 
   has_many :post_sells
   accepts_nested_attributes_for :roles
	def role?(role)
	    return !!self.roles.find_by_name(role.to_s)
	end

	mount_uploader :image, ImageUploader
end
