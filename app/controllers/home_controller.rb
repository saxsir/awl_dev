class HomeController < ApplicationController
  # GET /
  def index
    @projects = Project.find([1,2,3,4,5])
    respond_to do |format|
      format.html # index.haml
    end
  end
end
