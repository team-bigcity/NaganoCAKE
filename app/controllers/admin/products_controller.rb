class Admin::ProductsController < ApplicationController
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
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :image, :introduction,
      :genre_id, :non_taxed_price, :is_active)
  end
end
