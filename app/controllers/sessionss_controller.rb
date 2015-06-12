class SessionssController < ApplicationController
# 	require 'devise/strategies/database_authenticatable'
# require 'bcrypt'
	layout 'public'

	def new
		flash[:error] = ''
		if session[:account_id]
      		redirect_to plants_path
      	end
	end

	def create
		if params[:usename].blank?
			flash[:error1] = 'Không được để trống'
			if params[:password].blank?
        		flash[:error2] = 'Không được để trống'
      		end
      	  render 'new'
    	elsif params[:password].blank?
      		flash[:error2] = 'Không được để trống'
      		render 'new'
    	else
			@account = UserAccount.find_by(usename: params[:usename], password: params[:password])
		
			if @account 
				session[:account_id]   = @account.id
            	session[:account_name] = @account.name
            	redirect_to root_path
            else

            flash[:error] = 'Email hoặc password không đúng'
            render 'new'
        	end
		end
	end

	def destroy
		session[:role_account] = nil
		session[:account_id]   = nil
        session[:account_name] = nil
        redirect_to root_path
	end

end
