class Customer::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
    # @address_find = Address.find(params[:id])
  end

  def create
    @customer = current_customer
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(@customer), notice: "You have created address successfully."
    else
      @addresses = @customer.addresses
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
    @customer = current_customer
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: "You have updated address successfully."
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  
  private
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end
  
end
