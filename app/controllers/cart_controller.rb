class CartController < ApplicationController
  require 'json'
  def index
    @products = session[:cart]
    @total = 0
    @products.each do |product|
      @total = @total + product["quantity"]*product["price"].to_f
    end
    @total
  end

  def remove_from_cart
    id = params[:id].to_i

    session[:cart].delete(:id)
    redirect_to :controller => 'cart', :action => 'index'
  end

  def update_quantity

  end

end
