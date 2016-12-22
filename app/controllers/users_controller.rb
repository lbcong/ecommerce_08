class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "welcome"
      redirect_to request.referer
    else
      flash[:danger] = t "register_error"
      redirect_to request.referer
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :phone, :email, :address, :password,
      :password_confirmation
  end

end
