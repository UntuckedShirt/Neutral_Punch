class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

#whatever is assigned here is assigned to all "controllers"
# #adds specfied params for user
# ##current user returns the details of user who is logged in
#taken from application controller
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end 

     #checks if user is logged in
    def logged_in?
        #turn current_user into boolean to know if logged in
        #double !! in rails helps reuturn boolean which returns true or false
        !!current_user
    end
    
    def require_user
        if !logged_in?
            flash[:alert] = "You arent logged in"
            redirect_to login_path
        end

    end
end
