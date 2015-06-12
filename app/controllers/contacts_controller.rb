class ContactsController < ApplicationController

layout 'public'	

  def new
  	flash[:notice]=''
  	@contact = Contact.new
  end

  def create
  	@new_contact = Contact.new(adv_params)
		if @new_contact.save
			flash[:notice]='Nội dung liên hệ của bạn đã gởi thành công'
			render 'new'
		else
			flash[:notice]='Có lỗi. Xin mời nhập đầy đủ thông tin'
			render 'new'
		end
  end

  	private 

    def adv_params
	    params.require(:contact).permit(:name, :email, :phone_number, :description)
	end
  
end
