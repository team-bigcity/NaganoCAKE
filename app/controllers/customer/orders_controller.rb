class Customer::OrdersController < ApplicationController
  def index
     @orders = Order.all
  end

  def show
     @order = Order.find(params[:id])
  end

  def new
     @order = Order.new
  end

  def create
     @order = Order.new(params[:id])
    if @order.save
       redirect_to comfirm
    else
       @order = Order.new
       render new
    end
  end

  def confirm
    #   @products = Product.find_by(params[:id])
    #   @order = Order.find(params[:id])
    # if @order.save
    #   redirect_to complete_path
    # else
    #   @order = Order.new
    #   render new
    # end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:pstcode,:address,:name,:payment_method,:status)
  end

end
