class HomeController < ApplicationController
  # GET /
  def index
    @projects = Project.find([1,2,3,4,5])
    render :layout => 'home_template'
  end

  # GET /about
  def about
  end
end
