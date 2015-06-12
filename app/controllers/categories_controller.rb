class CategoriesController < ApplicationController
  helper_method :sort_column, :sort_direction, :per_page
  layout 'public', :only => [:show]

  before_action :find_category_id, only: [:show]

  def show
  	@title_page = 'Danh mục cây'
  	@plant_list = Plant.where(:category_id => @category_id.id)
  		.order(sort_column + " " + sort_direction).page(params[:page]).per(per_page)
  	# render json: @plant_list
  end

  private
  	def find_category_id
  		@category_id = Category.find(params[:id])
  	end
  	def sort_column
      @sort = "plants.name"
      if params[:sort]
        @sort = params[:sort]
      end
        Plant.joins(:plant_images).column_names.include?(params[:sort]) ? params[:sort] : @sort
    end

    def sort_direction
       @direction = "desc"
       if params[:direction]
        @direction = params[:direction]
      end
        %w[asc desc].include?(params[:direction]) ? params[:direction] : @direction
    end

    def per_page
    	@per = 9
    	if params[:per]
        	@per = params[:per]
    	end
      @per
    end

end
