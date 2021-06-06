class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            #rails proides a ssession instance method for each user
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully"
            redirect_to user
    else
        #render is not a new request for page. Its a form display
        #flash.now doesnt persist for 1 http request
            flash.now[:alert] = "This aint you, try again"
            render 'new'
    end
end

    def destroy
        #session.delete :username
        session[:user_id] = nil
        flash[:notice] = "logged out"
        redirect_to root_path
    end

end