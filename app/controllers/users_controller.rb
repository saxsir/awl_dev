class UsersController < ApplicationController

	def update
    @user = User.find(params[:id])
    puts @user.username
    puts params[:user]
    if @user.update_attributes(params[:user])
    	flash[:success] = "Successfully..."
    	redirect_to mypage_index_path(:username => @user.username)
    else
    	flash[:error] = "failed"
    	redirect_to mypage_index_path(:username => @user.username)
    end
	end

end