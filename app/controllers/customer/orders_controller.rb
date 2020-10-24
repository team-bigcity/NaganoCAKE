class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def index
     @orders = Order.all.order("created_at DESC")
     @order = OrderProduct.all
     @order_product = @order
  end

  def show
     @order = Order.find(params[:id])
     @orders = Order.all
     @order_product = @order.order_products
  end

  def new
    @order = Order.new
  end

  def create
     @order = Order.new(params[:id])
    if @order.save
       redirect_to orders_comfirm_path
    else
       @order = Order.new
       render :new
    end
  end

  def confirm
      @orders = Order.all
      @order_product = OrderProduct.all
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:pstcode,:address,:name,:payment_method,:status)
  end

end
