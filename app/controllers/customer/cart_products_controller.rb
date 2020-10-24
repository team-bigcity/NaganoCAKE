class Customer::CartProductsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_products = CartProduct.all
  end

  def create
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_products = CartProduct.all
    @cart_products.destroy_all
    redirect_to cart_products_path
  end
  
  private
  def cart_product_params
    params.require(:cart_product).permit(:amount)
  end
  
end
