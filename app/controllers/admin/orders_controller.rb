class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.all.order("created_at DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    #税込価格表示
    @order_products.each do |order_product|
      order_product.taxed_price = order_product.product.non_taxed_price * 1.1
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if  @order.status == "入金確認"
        @order_products = @order.order_products
        @order_products.update_all(making_status: "製作待ち")
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
