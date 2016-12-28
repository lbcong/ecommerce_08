class Admin::UsersController < ApplicationController
  def index
    @users = User.search(params[:search]).paginate per_page:
      Settings.per_pages.users, page: params[:page]
  end

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t ".user_not_found"
      redirect_to request.referer
    end
  end

  def destroy
   use = User.find(params[:id]).destroy
   if use.nil?
      flash[:danger] = t ".user_not_found"
   else
      flash[:success] = t ".user_delete"
   end
      redirect_to request.referer
  end
end
