# -*- coding: utf-8 -*-
class MypageController < ApplicationController
  before_filter :authenticate_user!

  # GET /mypage/:username
  def index
    @user = User.find(:all, :conditions => ['username = ?', params[:username]])
    
    if @user.empty?
      # 該当ユーザーなし
      redirect_to :action => "error"
    else
      # username重複は登録時にチェック
      @user = @user[0]
      if @user.artist
        render :template => 'mypage/artist_index'
      else
        render :template => 'mypage/user_index'
      end
    end
  end

  # GET /mypage/:username/edit
  def edit
    
  end

  # GET /mypage/:username/error
  def error
    
  end
end
