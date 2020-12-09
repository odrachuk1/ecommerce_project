class CartController < ApplicationController
  require 'json'

  def index
    @products = session[:cart]
    @subtotal = get_subtotal(@products)
    @taxes = get_taxes(@products)
    @total = @subtotal + @taxes
  end

  def get_product_total(product)
    product["quantity"] * product["price"].to_f
  end

  def get_subtotal(products)
    subtotal = 0
    products.each do |product|
      subtotal = subtotal + get_product_total(product)
    end
    subtotal
  end

  def get_taxes(products)
    customer = Customer.find_by(id: session[:customer_id])
    province = Province.find_by(id: customer.province_id)
    gst_hst = province.gst_hst.to_f
    pst = province.pst.to_f
    taxes = get_subtotal(products) * gst_hst + get_subtotal(products) * pst
  end

  def remove_from_cart
    cart = session[:cart]
    item = cart.find { |item| item["id"] == params[:id].to_i }
    cart.delete(item)
    subtotal = get_subtotal(cart)
    taxes = get_taxes(cart)
    total = subtotal + taxes
    render json: { id: params[:id], subtotal: subtotal, taxes: taxes, total: total }
  end

  def increment(item)
    item["quantity"] + 1
  end

  def decrement(item)
    item["quantity"] - 1
  end

  def qty
    cart = session[:cart]
    item = cart.find { |item| item["id"] == params[:id].to_i }
    if request.post?
      if params[:operation] == "plus"
        item["quantity"] = item["quantity"] + 1
      elsif params[:operation] == "minus"
        item["quantity"] = item["quantity"] - 1
        if item["quantity"] == 0
          cart.delete(item)
        end
      end
    end
    subtotal = get_subtotal(cart)
    taxes = get_taxes(cart)
    total = subtotal + taxes
    render json: { id: params[:id], quantity: item["quantity"],
                   product_total: get_product_total(item), subtotal: subtotal, taxes: taxes, total: total }
  end

end
