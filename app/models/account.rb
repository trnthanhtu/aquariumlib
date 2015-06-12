class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable

   has_and_belongs_to_many  :roles 
   has_many :posts
   accepts_nested_attributes_for :roles
	def role?(role)
	    return !!self.roles.find_by_name(role.to_s)
	end

  before_save do
    self.image = self.file.original_file
  end

	mount_uploader :image, ImageUploader
end
