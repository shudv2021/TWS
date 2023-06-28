class SessionsController < ApplicationController
  before_action :admisible_authentification?, only: %i[new create]
  before_action :admisible_logout?, only: :destroy
  def new
  end
  
  def create
    user = User.find_by(phone: params[:phone])
    if user&.authenticate(params[:password])
      sign_in(user)
      remember(user) if params[:remember_me] == '1'
      redirect_to root_path
    else
      flash[:warning] = 'You get a mistake!'
      redirect_to new_session_path
    end
      
  end
  
  def destroy
  sign_out
  redirect_to root_path
  end
  
end