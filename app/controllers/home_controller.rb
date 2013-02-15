class HomeController < ApplicationController
  # GET /
  def index
    @projects = Project.find(:all, :conditions => {:slideshow => true})
    respond_to do |format|
        format.html # index.html.erb
      end
  end

  # GET /about
  def about
  end
end
