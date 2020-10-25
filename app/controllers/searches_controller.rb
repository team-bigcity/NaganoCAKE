class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    word = params[:word]
    if @range == '1'
      @customers = Customer.search(params[:word])
    else
      @products = Product.search(params[:word]).page(params[:page]).per(10)
    end
  end
  
end
