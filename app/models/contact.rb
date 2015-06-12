class Contact < ActiveRecord::Base
	validates :name, :email, :phone_number, :description,
     	:presence =>  { :message => "Không được để trống" }, :on => :create
end