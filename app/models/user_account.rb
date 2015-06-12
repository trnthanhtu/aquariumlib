class UserAccount < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :post_sells 
  has_many :messages
  #validate cant be blank
  	validates :name, :usename, :password, :phone_number,
     	:presence =>  { :message => "Không được để trống" }, :on => :create

    #validate number text
  	validates :phone_number, 
  		numericality: { only_integer: true, :message=>"Chỉ được nhập số tự nhiên"},
  		length: { minimum: 10, too_short: " Tối thiểu 10 chữ số",
                maximum: 11, too_long: " Tối đa 11 chữ số" }
  		# length: { maximum: 11, too_long: " Tối đa 11 chữ số" }

  	#validate lenght
  	validates :name, :usename, :password, :address, 
  		length: { minimum: 8, too_short: " Độ dài tối thiểu 8 ký tự" },
  		length: { maximum: 255, too_long: "Chỉ nhập tối đa 255 ký tự" }

end
