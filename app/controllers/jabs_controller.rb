class JabsController < ApplicationController

    def show
        @jab = Jab.find(params[:id])
    end

    def index
        #view abailability
        @jabs = Jab.all
    end

    def new
        @jab = Jab.new
    end

    def create
        @jab = Jab.new(params.require(:jab).permit(:title, :description))
        if @jab.save
            flash[:notice] = "Jab was thrown successfully"
            redirect_to @jab

        else
            #if saving fails render to form
            render 'new'

        end
      end

end