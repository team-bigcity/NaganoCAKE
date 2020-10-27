class Customer::ProductsController < ApplicationController
  def top
    rank_order_product_product_ids = OrderProduct.group(:product_id).order(amount: "DESC").limit(4).pluck(:product_id)
    @rank_products = Product.where(id: rank_order_product_product_ids).order_as_specified(id: rank_order_product_product_ids)
    @genres = Genre.where(is_active: true)
    @products = Product.all.page(params[:page]).per(4)
    # @product = Product.find(params[:id])
  end

  def index
    @products = Product.all.page(params[:page]).per(8)
    @genres = Genre.where(is_active: true)
  end

  def sort
    @genre = Genre.find(params[:id])
    @products = @genre.products.page(params[:page]).per(8)
    @genres = Genre.where(is_active: true)
    render :index
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
