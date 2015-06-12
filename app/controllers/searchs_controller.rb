class SearchsController < ApplicationController
	layout 'public'

	def index
		search
	end

	private

	def search
		if params[:search] != ''
			@list_search = Plant.joins(:category)
							.where("plants.name like ?", "%#{params[:search]}%")
							.order('plants.name asc')
							.page(params[:page]).per(12)
							
		else
			@list_search = Plant.all.page(params[:page]).per(12)
		end
		@list_search
	end

end
