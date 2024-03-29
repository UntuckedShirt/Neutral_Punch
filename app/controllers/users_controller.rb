class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

def show
    #@user = User.find(params[:id])
    @jabs = @user.jabs
end

def index
  @users = User.all
end

  def new
    @user = User.new
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "Your profile was successfully updated"
        redirect_to @user
      else
        render 'edit'
      end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}, to NeutralPunch"
      redirect_to jabs_path
    else
      render 'new'
    end
  end

    def destroy
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Challenger and assests will be permanently disqualified"
      redirect_to jabs_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])

  end

  def require_same_user
    if current_user != @user && !current_user.admin?
        flash[:alert] = "You can only edit or delete account"
        redirect_to @user
    end
  end
