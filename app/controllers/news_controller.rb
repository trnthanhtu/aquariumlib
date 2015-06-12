class NewsController < ApplicationController
  layout 'public'

  def index
  	@list_post = Post.all.order('created_at')
  				.page(params[:page]).per(per_page)
  end

  def show
  	@list_post_item = Post.find(params[:id])
  end

  private
  	def per_page
    	@per = 6
    	if params[:per]
        	@per = params[:per]
    	end
      @per
    end
  
end
