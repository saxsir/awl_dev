# -*- coding: utf-8 -*-
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

    if @project.state == "new"
      if current_user.id != @project.user_id
        redirect_to root_path
      end
    end

    if @project.state == "examinate"
      redirect_to root_path
    end

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
        redirect_to root_path, :notice => "Permission Error: You Don't have...."
    else
      @project = Project.new

      respond_to do |format|
        format.html # new.html.erb
      end
    end
  end


  #edit機能を停止してる
  "
   # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end
  "

 # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project],:user_id => current_user.id, :total_amount => 0, :state => "new")

    # stateはここで追加。バリデーション書くならここで。
    # new, pending, open, success, failedだっけ？
    @project.user_id = current_user.id
    @project.total_amount = 0
    @project.state = "new"

    if @project.save
      redirect_to :action => "reward", :project_id => @project.id
    else
      respond_to do |format|
        format.html { render :action =>  "new" }
      end
    end
  end

  # GET /projects/new/rewards
  def reward
    @project = Project.find(params[:project_id])

    #直にURLタイプして飛んでこれてしまうのでバリデーション
    if current_user.id != @project.user_id
      redirect_to root_path, :notice => "Permission Error: This Project is not made by you!"
    end

    if @project.state != "new" then
      redirect_to root_path, :notice => "Permission Error: This Project is not in the time Editable"
    end

    @reward = Reward.new
    respond_to do |format|
      format.html # reward.html.haml
      #format.json { render json: @project }
      #format.json { render json: @reward }
    end
  end


  def save_reward_ajax
    @reward = Reward.new(params[:reward])

    @reward.project_id = params[:project_id]
    #ajaxのcallbackに渡してあげたい。上手く行ったらviewを操作するので
    if @reward.save
      #jsになんか命令飛ばせると思う
    else
      @reward.destroy
    end

    preview_html = ApplicationController.helpers.reward_preview_ajax(@reward)
    #render :json => { :html => preview_html }
    render :text => preview_html

  end

  def destroy_reward_ajax
    @reward = Reward.find(params[:reward_id])
    #ajaxのcallbackに渡してあげたい。上手く行ったらviewを操作するので
    @reward.destroy

    render :text => params[:reward_id]
  end

  #作成ページ３でOK押した時
  def confirm_project
    @project  = Project.find(params[:id])
    #あとrewardも（state次第で全部)goingにしなきゃいけないけど・・・

    @project.state = "examinate"

    #どっちにしろ戻る
    if @project.save
      redirect_to root_path, :notice => "Success!"
    else
      redirect_to root_path, :notice => "Error!"
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



