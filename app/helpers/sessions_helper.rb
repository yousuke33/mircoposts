module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    def logged_in?
        !current_user.nil?
    end
    
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
end