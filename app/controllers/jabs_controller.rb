class JabsController < ApplicationController

    def show
        @jab = Jab.find(params[:id])
    end

end