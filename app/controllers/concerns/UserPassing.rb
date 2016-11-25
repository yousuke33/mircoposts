class UserPassing
    def before(controller)
        info_passing "before: #{controller.action_name}"
        
    end
    
    private
    def info_passing
        @user = User.find(params[:id])
        @followings = @user.following_user_ids
        @followers = @user.follower_user_ids
        @likes = @user.likes.order(created_at: :desc)
    end
end