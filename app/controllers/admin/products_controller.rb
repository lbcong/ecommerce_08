class Admin::ProductsController < ApplicationController
  layout "admin"

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".create_product_success"
    else
      flash[:notice] = t ".create_product_fail"
    end
    redirect_to :back
  end

  def edit
  end

  private
  def product_params
    params.require(:product).permit :category_id, :name, :description,
      :image, :quantity, :price
  end

end
