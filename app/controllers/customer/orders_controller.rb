class Customer::OrdersController < ApplicationController
  #ログインユーザーのみ閲覧可
	before_action :authenticate_customer!

  def index
     @orders = current_customer.orders
  end

  def show
     @order = Order.find(params[:id])
     @order_product = @order.order_products
  end

  def new
    @order = Order.new
  end

  def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
    if  @order.save!
      @carts = current_customer.cart_products
      @carts.each do |cart|
          order_product = OrderProduct.new(order_id: @order.id)
          order_product.taxed_price = cart.product.non_taxed_price
          order_product.amount = cart.amount
          order_product.product_id = cart.product_id
          order_product.save!
      end
      @carts.destroy_all
       redirect_to orders_complete_path
    else
       @order = Order.new
       render :new
    end
  end

  def confirm
      @carts = current_customer.cart_products
      @order = Order.new
      @order.customer_id = current_customer.id
      @order.payment_method = params[:order][:payment_method]
    if "ご自身の住所" == params[:order][:current_customer]
        @order.name = current_customer.last_name
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
    elsif "登録済み住所から選択" == params[:order][:current_customer]
        @address = Address.find_by(params[:order][:address])
        @order.name = @address.name
        @order.postcode = @address.postcode
        @order.address = @address.address
    elsif "新しいお届け先"  == params[:order][:current_customer]
        @address = Address.new
        @address.name = params[:order][:name]
        @address.postcode = params[:order][:postcode]
        @address.address = params[:order][:address]
        @address.customer_id = current_customer.id
        @address.save!
        @order.name = @address.name
        @order.postcode = @address.postcode
        @order.address = @address.address
    else
        @order = Order.new
        render :new
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postcode,:address,:name,:payment_method,:status,:total_payment)
  end

end