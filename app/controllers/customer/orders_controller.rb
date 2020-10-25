class Customer::OrdersController < ApplicationController
  #ログインユーザーのみ閲覧可
	before_action :authenticate_customer!

  def index
     @orders = Order.all.order(current_customer)
     @order = OrderProduct.all
     @order_product = @order
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
    if  @order.save
      @cart = CartProduct.find_by()
    #   @cart.each do |cart|
    #   order_product = OrderProduct.new(order_id :order.id)
    #   order_product.taxed_price = cart.product.non_taxed_price
    #   order_product.amount = cart.amount
    #   order_product.name = cart_product.name
    #   order_product.making_status = carts.product.introduction
    #   order_product.mage_id = cart_product.mage_id
    #   order_product.genre_id = cart_product.genre_id
    #   order_product.save
    #   @cart.destroy_all
       redirect_to orders_complete_path
    else
       @order = Order.new
       render :new
    end
    #ordered_productにデータ挿入
		# 	ordered_product = []
		# 	@ordered_product = @current_customer.cart_products
		# 		@ordered_product.each do |op|
		# 			 ordered_product << @order_product.build(product_id: op.product_id, price: op.taxed_price, amount: op.amount, making_status: op)
		# 		end
		# 	OrderedProduct.import order_product
  end

  def confirm
      @carts = CartProduct.all
      @order = Order.new
      @order.payment_method = params[:order][:payment_method]
    if "ご自身の住所" == params[:order][:current_customer]
        @order.name = current_customer.last_name
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
    elsif "登録済み住所から選択" == params[:order][:current_customer]
        @address = Address.find_by(params[:Address])
        @order.name = @address.name
        @order.postcode = @address.postcode
        @order.address = @address.address
    elsif "新しいお届け先"  == params[:order][:current_customer]
        @address = Address.new
        @address.name = @order.name
        @address.postcode = @order.postcode
        @address.address = @order.address
        
        @address.save
        @order.name = @address.name
        # @order.postcode = @address.postcode
        # @order.address = @address.address
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
 # binding.pry