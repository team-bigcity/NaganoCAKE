class Customer::CustomersController < ApplicationController
    
  def my_page
    @customer = current_customer
    # @customer = Customer.find(params[:id])
  end
  
  def edit
    # @customer = Customer.find(params[:id])
  end
  
  def destroy_page
  end
  
  def is_deleted
    # @customer = Customer.find(params[:id])
  end
  
  def hide
        @customer = Customer.find(params[:id])
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @customer.update(is_deleted: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
  end
  
  # def destroy
  #   @customer = Customer.find(params[:id]).destroy
  #   # flash[:success] = "User deleted"
  #   redirect_to about_path
  # end
end
