class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.paginate per_page: Settings.per_pages.products,
      page: params[:page]
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".create_product_success"
    else
      flash[:danger] = t ".create_product_fail"
    end
    redirect_to request.referer
  end

  def edit
  end

  def destroy
    product = Product.find_by(id: params[:id]).destroy
    if product.nil?
      flash[:danger] = t ".product_not_found"
    else
    flash[:success] = t ".product_delete"
    end
    redirect_to request.referer
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :image, :quantity,
     :price, :category_id
  end
end
