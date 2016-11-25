class LikesController < ApplicationController
    before_action :info_passing, only: [:show]
    def show
        @user = User.find(params[:id])
        @micropost = Micropost.all
        @likes = @user.likes
    end
    
    def destroy
        like = Like.find(params[:like_id])
        like.destroy
        redirect_to request.referrer || root_url
    end
    
    private
    def info_passing
        @user = User.find(params[:id])
        @followings = @user.following_user_ids
        @followers = @user.follower_user_ids
        @likes = @user.likes.order(created_at: :desc)
    end
end
