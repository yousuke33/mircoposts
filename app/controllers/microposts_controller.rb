class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create,:destroy]
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_path
        else
            @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
            render 'static_pages/home'
        end
    end
    
    def destroy
        @micropost = current_user.microposts.find_by(id: params[:id])
        return redirect_to root_url if @micropost.nil?
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
    end
    
    def retweet
        micropost = Micropost.find_by(id: params[:id])
        @micropost = current_user.microposts.build(user_id: current_user.id, 
                    content: micropost.content, retweet_id: micropost.id)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_path
        else
            @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
            render 'static_pages/home'
        end
    end
    
    def likes
        micropost = Micropost.find_by(id: params[:id])
        @like = current_user.likes.new(micropost_id: micropost.id)
        if @like.save
            redirect_to root_path
        else
            render 'static_pages/home'
        end
    end    
    
    private
    def micropost_params
        params.require(:micropost).permit(:content)
    end
end
