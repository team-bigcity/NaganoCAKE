class Customer::ProductsController < ApplicationController
  def top
    @genres = Genre.all
  end

  def index
    # @product = Product.find(params[:id])
    @products = Product.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :image, :non_taxed_price, :is_active)
  end
end
