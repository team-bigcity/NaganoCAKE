class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
    @genre = Genre.where(is_active: true)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path(@product)
    else
      @genre = Genre.where(is_active: true)
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @genre = Genre.where(is_active: true)
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :image, :introduction,
      :genre_id, :non_taxed_price, :is_active)
  end
end
