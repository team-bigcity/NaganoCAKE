class Customer::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    # @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:id])
    if @order.save
       redirect_to confirm
    else
       @order = Order.new
       render new
    end
  end

  def confirm
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:pstcode,:address,:name,:payment_method,:status)
  end

end

