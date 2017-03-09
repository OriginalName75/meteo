class CreateUserController < ApplicationController
  def new
    @user = Rasb.new
  end

  def create
    user = Rasb.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
