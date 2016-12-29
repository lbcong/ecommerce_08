class Admin::SuggestProductsController < ApplicationController
  before_action :verify_admin

  def index
    @suggest_products = SuggestProduct.
      by_name(params[:search]).paginate per_page: Settings.per_page.suggest,
        page: params[:page]
  end

  def destroy
    suggest = SuggestProduct.find_by id: params[:id]
    if suggest.destroy
      flash[:success] = t".product_delete"
    else
      flash[:danger] = t".product_not_found"
    end
    redirect_to request.referer
  end
end
