class AdvsController < ApplicationController
 	# set layout
 	layout 'public'
 	helper_method :sort_type

 	before_action :check_session, :only =>[:new]
 	
 	before_action :get_list_infor_sell, :only => [:index, :show, :new]
 	before_action :find_id, :only => [:show, :update]
 	before_action :type_postsell, :only => [:new, :create, :index]

	def index
		@title_page = "GÓC RAO VẶT"
		@list_type  = ["Buôn bán", "Trao đổi", "Chia sẻ", "Hội họp" ]
		@list_post_sell = PostSell.joins(:user_account)
							.where(:type => type_postsell)
							.order( 'created_at desc')
	end

	def show
		@person_adv = UserAccount.find(@adv_show.user_account_id)
		session[:advs_show_id] = @adv_show.id
	end

	def new
		@title_page = "GÓC RAO VẶT"
		@title_form = "ĐĂNG BÀI VIẾT MỚI"
		@adv = PostSell.new
	end

	def create
		@adv = PostSell.new(adv_params)
		@adv.type = @post_sell_type
		@adv.user_account_id = session[:account_id]
		if @adv.save
			redirect_to advs_path
		else
			redirect_to plants_path
		end
	end

	def edit
		@title_form = "CHỈNH SỬA BÀI ĐĂNG"
		@title_menu = 'TÊN DANH MỤC'
		@adv= PostSell.find(params[:id])
	end

	def update
		if @adv_show.update(adv_params)
			redirect_to adv_path(@adv_show.id)
		end 

	end

	def add_message
		# render json: params
		if params[:description] != ''
			@message = Message.new
			@message.detail = params[:description]
			@message.post_sell_id = session[:advs_show_id]
			if session[:role_account] == nil
				@message.user_account_id = session[:account_id]
			else
				@message.admin = 1
			end	
			if @message.save
				@tb = "success!"
			end			
		end
		render json: {"tb" =>'Successed'}
	end

	def destroy
		# bingding.pry
		if params[:adv_id]
	    		@adv_show = PostSell.find(params[:adv_id])
	    @adv_show.destroy
	    Message.where(:post_sell_id => params[:adv_id]).destroy_all
	    respond_to do |format|
	      format.html { redirect_to advs_path}
	      format.json { head :no_content }
		end
		end
	end

	def destroy_message
		if params[:adv_id] != ''
			@message = Message.find(params[:adv_id])
			if @message.destroy
				@tb = "success!"
			end			
		end
		render json: {"tb" =>'Successed'}
	end

	private
		# get list type post
		def get_list_infor_sell
			@list_type  = ["Buôn bán", "Trao đổi", "Chia sẻ", "Hội họp" ]
			@title_page = "GÓC RAO VẶT"
		end

	    def sort_type
	    	@type = 'Buôn bán'
	    	if params[:type]
	        	@type = params[:type]
	    	end
	      @type
	    end

	    # get params 
	    def adv_params
	      params.require(:adv).permit(:title, :image, :description)
	    end

	    # get type for advs.type
	    def type_postsell
	    	params[:type] ? @post_sell_type = params[:type] : @post_sell_type = 'Buôn bán'
	       	@post_sell_type
	    end

	    def find_id	
	    		@adv_show = PostSell.find(params[:id]) 
	    end
end
