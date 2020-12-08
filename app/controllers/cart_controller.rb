class CartController < ApplicationController
  require 'json'

  def index
    @products = session[:cart]
    @total = 0
    @products.each do |product|
      @total = @total + product["quantity"] * product["price"].to_f
    end
    @total
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(:id)
    redirect_to :controller => 'cart', :action => 'index'
  end

  def increment(item)
    new_quantity = item["quantity"] + 1
    new_quantity
  end

  def decrement(item)
    new_quantity = item["quantity"] - 1
    new_quantity
  end

  def qty
    @cart = session[:cart]
    @item = @cart.find { |item| item["id"] == params[:id].to_i }

    if request.post?
      new_quantity = increment(@item)
    elsif request.delete?
      new_quantity = decrement(@item)
    end

    return render json: { new_quantity: new_quantity}
  end

end
