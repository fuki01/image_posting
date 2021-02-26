class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.search(params[:search]).page(params[:page]).per(5)
  end
  def show
    @user       = User.find(params[:id])
    @followers  = @user.followers
    @followings = @user.followings
    @contexts   = @user.context.all.page(params[:page]).per(15)
  end
  def follows
    user   = User.find(params[:id])
    @users = user.followings.page(params[:page]).per(5)
  end
  def followers
    user   = User.find(params[:id])
    @users = user.followers.page(params[:page]).per(5)
  end
end
