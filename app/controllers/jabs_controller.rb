class JabsController < ApplicationController
    before_action :set_jab, only: [:show, :edit, :update, :destroy]

    def show
        
    end

    def index
        #view abailability
        @jabs = Jab.all
    end

    def new
        @jab = Jab.new
    end

    def edit
        

    end

    def create
        @jab = Jab.new(jab_params)
        @jab.user = User.first
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
        
        @jab.destroy
        redirect_to jabs_path
      end
end

private

def set_jab
    @jab = Jab.find(params[:id])
end

def jab_params
    params.require(:jab).permit(:title, :description)
end
