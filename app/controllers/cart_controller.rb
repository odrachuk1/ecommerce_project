class CartController < ApplicationController
  def index
    @cart = Product.find(session[:cart])
  end

  def remove_from_cart
    id = params[:id].to_i

    session[:cart].delete(id)
    redirect_to :controller => 'cart', :action => 'index'
  end

  def update_quantity
    @line_item.update_attribute(:quantity)
  end
end
