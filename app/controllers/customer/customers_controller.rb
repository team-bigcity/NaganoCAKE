class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
    
  def my_page
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
    unless current_customer.nil? || current_customer.id == @customer.id
      flash[:warning] = "アクセス権がありません"
      redirect_to edit_customer_path(current_customer)
    end
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path, notice: "You have updated customer successfully."
    else
      render :edit
    end
  end
  
  def destroy_page
    @customer = current_customer
  end
  
  def is_deleted
  end
  
  def leave
    @customer = current_customer
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @customer.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number)
  end
  
end
