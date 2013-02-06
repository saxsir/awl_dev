class HomeController < ApplicationController
  def index
    @projects = Project.all
    respond_to do |format|
      format.html # index.haml
    end
  end
end
