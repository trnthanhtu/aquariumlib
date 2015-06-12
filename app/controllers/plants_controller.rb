class PlantsController < ApplicationController
  layout  'application',  :only  => [:index]
  layout  'public', :only => [:show]
  before_action :find_plant_id, :only => [:show]

  def index
    @list_item_news = type_news.all.limit(6).order('created_at desc')
    
    if $session_account_admin
       session[:account_id] = $session_account_admin
       session[:role_account] = 'admin'
       # binding.pry
    end
    $session_account_admin = nil
    # binding.pry
  end

  def show
  	@plantimage = PlantImage.where(:plant_id => @plant_id).limit(4)
  	                        .order(:created_at =>  'desc')
  	@count_i    = @plantimage.size
  	@plant_relasted = Plant.where(:category_id => @plant_id.category_id)
  					  .where.not(:id=> @plant_id)
  					  .limit(8).order("RAND()")
    @plant_id.technical_id ? @technical = Technical.find(@plant_id.technical_id) : ''
   end

  def edit
  end



  private
    def find_plant_id
  		@plant_id = Plant.find(params[:id])
  	end

    def type_news
      params[:type] ? @type_news = params[:type] : @type_news = 'plant'
      @type_news.camelize.constantize
    end  
end
