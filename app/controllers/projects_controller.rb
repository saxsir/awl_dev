class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :only => :new
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/procedure
  def procedure
    @project = Project.find(params[:id])
    @support = Support.new #新規作成用

    if user_signed_in?
      @user = current_user
    end

    respond_to do |format|
      format.html #procedure.haml
      format.json { render json: @project }
      format.json { render json: @support }
      format.json { render json: @user }
    end
  end


  # GET /projects/new
  # GET /projects/new.json
  def new
    # アーティスト以外は作成できない
    unless current_user.artist
        # 権限がないですよ的なページに飛ばす
        # あとでつくる
        redirect_to :action => "index", :status => :forbidden
    else
      @project = Project.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @project }
      end
    end
  end

   # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

 # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    # stateはここで追加。バリデーション書くならここで。
    # new, pending, open, success, failedだっけ？
    @project.user_id = current_user.id
    @project.total_amount = 0
    @project.state = "new"

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  # GET /projects/thanks
  def thanks
  end
end



