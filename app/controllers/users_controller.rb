class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :info_passing, only: [:followings, :followers]
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
    @followings = @user.following_user_ids
    @followers = @user.follower_user_ids
    @likes = @user.likes.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    unless session[:user_id] == @user.id
      flash[:danger] = "You did not login this user"
      redirect_to @user
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else 
      render 'edit'
    end
  end
  
  def followings
    @users = @user.following_users
    @title = "following"
    render 'users'
  end
  
  def followers
    @users = @user.follower_users
    @title = "followed"
    render 'users'
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:area,:profile)
  end
  def info_passing
    @user = User.find(params[:id])
    @followings = @user.following_user_ids
    @followers = @user.follower_user_ids
    @likes = @user.likes.order(created_at: :desc)
  end
end
