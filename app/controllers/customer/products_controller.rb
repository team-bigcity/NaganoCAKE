class Customer::ProductsController < ApplicationController
  def top
    @genres = Genre.where(is_active: true)
    @products = Product.all.page(params[:page]).per(4)
    # @product = Product.find(params[:id])
  end

  def index
    
    @products = Product.all.page(params[:page]).per(8)
    @genres = Genre.where(is_active: true)
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_product = CartProduct.new
  end
  
  # private
  # def product_params
  #   params.require(:product).permit(:name, :introduction, :genre_id, :image, :non_taxed_price, :is_active)
  # end
end
