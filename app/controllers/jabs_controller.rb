class JabsController < ApplicationController
  #this is a helper. You are passing in method name as a symbol to this method which is before_action
  #it performs this action for the actions needed
  before_action :set_jab, only: [:show, :edit, :update, :destroy]
  #prevents actions while not being logged in
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
        
    end

    def index
        #view abailability
        @jabs = Jab.paginate(page: params[:page], per_page: 5)
    end

    def new
        @jab = Jab.new
    end

    def edit
        

    end

    def create
        @jab = Jab.new(jab_params)
        @jab.user = current_user
        if @jab.save
            flash[:notice] = "Jab was thrown successfully"
            redirect_to @jab
        else
            #if saving fails render to form
            render 'new'
        end
      end

      def update
        
        if @jab.update(jab_params)
          flash[:notice] = "Jab was revised and practiced successfully."
          redirect_to @jab
        else
          render 'edit'
        end
      end

      def destroy  
        @jab = Jab.find(params[:id])      
        @jab.destroy
        redirect_to jabs_path
      end

private

def set_jab
    @jab = Jab.find(params[:id])
end

def jab_params
    params.require(:jab).permit(:title, :description)
end

def require_same_user
  if current_user != @jab.user && !current_user.admin?
    flash[:alert] = "You can only edit or delete your own jab"
    redirect_to @jab
  end
end
end
