class PagesController < ApplicationController

  def home
    #this renders the homepage view
    redirect_to jabs_path if logged_in?

end

  def about
    
  end
    
end