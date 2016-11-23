class LikesController < ApplicationController
    
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
end
