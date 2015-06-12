class ShopsController < ApplicationController
	layout 'public', :only => [:index]
	before_action :get_list_infor_shop, :only => [:index]
	helper_method :sort_area

	def index
		@shops = Shop.where(:township => sort_area)
	end

	private
	def get_list_infor_shop
		@list_area = ["Quận Cẩm Lệ" ,"Quận Sơn Trà" ,"Quận Ngũ Hành Sơn " ,"Quận Hải Châu" ,"Quận Thanh Khê" ,"Quận Liên Chiểu"]
		@title_page = "SHOP THỦY SINH"
	end
    def sort_area
    	@area = 'Quận Hải Châu'
    	if params[:area]
        	@area = params[:area]
    	end
      @area
    end

end
