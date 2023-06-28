class UsersController < ApplicationController
  before_action :admisible_authentification?, only: %i[new create]
  before_action :admisible_logout?, only: %i[edit update]
  before_action :set_user, only: %i[edit update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
    render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update user_params
    flash[:success] = "You change user's parametrs"
    render :edit
    else
    render :edit
    end
  end
  
  private
  
  def set_user
    @user = User.find params[:id]
  end
  
  def user_params
    params.require(:user).permit(:first_name, :second_name, :famaly_name, 
                                  :email, :phone, :password, :password_confirmation, :old_password)
  end
  
end