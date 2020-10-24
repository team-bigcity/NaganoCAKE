class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    if  @order_product.making_status == "製作中"
        @order = @order_product.order
        @order.update(status: "製作中")
    end
    @order = @order_product.order
    @order_products = @order.order_products
    if  @order_products.where(making_status: "製作完了").count == @order_products.count
        @order.update(status: "発送準備中")
    end
    redirect_to admin_order_path(@order_product.order)
  end

  private
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end

end
