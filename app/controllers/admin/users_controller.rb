class Admin::UsersController < ApplicationController
  before_action :verify_admin
  before_action :load_user, only: [:show, :destroy]

  def index
    @users = User.by_name(params[:search]).paginate
      per_page: Settings.per_page.users, page: params[:page]
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".user_delete"
    else
      flash[:danger] = t ".user_not_found"
    end
    redirect_to request.referer
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t ".user_not_found"
      redirect_to request.referer
    end
  end
end
