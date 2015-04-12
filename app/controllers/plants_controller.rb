class PlantsController < ApplicationController
  layout  'application',  :only  => [:index]
  layout  'public', :only => [:show]

  def index
  end

  def show
  end

  def edit
  end

end
