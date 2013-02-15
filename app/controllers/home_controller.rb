class HomeController < ApplicationController
  # GET /
  def index
    @projects = Project.find(:all, :conditions => {:slideshow => true})
    render :layout => 'home_index_template'
  end

  # GET /about
  def about
  end
end
