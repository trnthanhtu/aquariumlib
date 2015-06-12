class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :header
  
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  def header 
    @category = Category.all
  end

  # check session account login if they wanna write post
  def check_session
    if session[:account_id].blank? || session[:account_id]==nil
      redirect_to  login_path
    end
  end
end
