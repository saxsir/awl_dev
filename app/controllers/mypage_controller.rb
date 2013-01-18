# -*- coding: utf-8 -*-
class MypageController < ApplicationController
  before_filter :authenticate_user!

  # GET /:username
  def index
    @user = User.find(:all, :conditions => ['username = ?', params[:username]])
    
    if @user.empty?
      # 該当ユーザーなし
      redirect_to :action => "error"
    else
      # username重複は登録時にチェック
      @user = @user[0]
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  end

  # GET /:username/edit
  def edit
    
  end

  # GET /:username/error
  def error
    
  end
end
