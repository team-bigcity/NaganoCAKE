class Customer::CustomersController < ApplicationController
    
  def my_page
    @customer = current_customer
    # @customer = Customer.find(params[:id])
  end
  
  def edit
  end
  
  def destroy_page
  end
  
  def destroy
    @customer = Customer.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    redirect_to about_path
  end
end
