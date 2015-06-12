class AccountssController < ApplicationController
	layout 'public'

	before_action :check_session, :only =>[:index, :edit, :show]
	before_action :find_user_session, :only => [:index, :edit, :update]
	before_action :check_params_password, :only => [:update]
	before_action :find_user_by_id, :only   => [:show]

	def index
		if session[:role_account] == nil
			@advs = PostSell.where(:user_account_id  => session[:account_id]).order('created_at desc')
		else
			@advs = nil
		end
	end

	def new
		flash[:error] = ''
		@user_account = UserAccount.new
	end

	def create

		if params[:password_confirm]
			if params[:password_confirm] != params[:user_account][:password]
				flash[:error] = '&#8226; '.html_safe + 'Mật khẩu không đúng'
				# render 'new'
			end	
		else 
			flash[:error] = '&#8226; '.html_safe + 'Không được để trống'
			# render 'new'
		end	
		@user_account = UserAccount.new(use_params)
		if @user_account.save
			flash[:new_account] = params[:user_account][:usename]
			redirect_to login_path
		else
			respond_to do |format|
		        format.html { render :new }
		        format.json { render json: @user_account.errors, status: :unprocessable_entity }
        	end
		end
	end

	def edit
		flash[:error_password_old] = ''
		flash[:error_password_confirm] = ''
	end

	def update
		if params[:password] != ''
			if @user_account_login.update(use_params_update.merge(password: params[:password] ))
				redirect_to accountss_index_path
			else
				respond_to do |format|
			        format.html { render :edit }
			        format.json { render json: @user_account_login.errors, status: :unprocessable_entity }
	        	end
			end
		else
			if @user_account_login.update(use_params_update)
				redirect_to accountss_index_path
			else
				respond_to do |format|
			        format.html { render :edit }
			        format.json { render json: @user_account_login.errors, status: :unprocessable_entity }
	        	end
			end
		end
	end

	def show
		@advs = PostSell.where(:user_account_id  => @user_account_login.id).order('created_at desc')
	end

	private
		def use_params
	      params.require(:user_account).permit(:name, :image, :address, :phone_number, :birthday, :password, :usename, :image)
	    end

	    def use_params_update
	      params.require(:user_account_login).permit(:name, :image, :address, :phone_number, :birthday, :usename, :image)
	    end

	    def find_user_session
	    	if session[:role_account] == 'admin'
	    		@user_account_login = Account.find(session[:account_id])
	    	else
	    		@user_account_login = UserAccount.find(session[:account_id])
	    	end
	    end

	    def find_user_by_id
	    	@user_account_login = UserAccount.find(params[:id])
	    end

	    # check password and confirm password when user wanna update their password
	    def check_params_password
	    	binding.pry
	    	flash[:error_password_old] = ''
			flash[:error_password_confirm] = ''
			if params[:password_old] != '' && params[:password] != '' && params[:password_confirm] != ''
				if params[:password_old] != @user_account_login.password
					flash[:error_password_old] = 'Mật khẩu không đúng'
					render 'edit'
				else
					if params[:password] != params[:password_confirm]
						flash[:error_password_confirm] = 'Mật khẩu xác thực không đúng '
						render 'edit'
				
					end
				end
			end
	    end
end
