class OrderController < ApplicationController
  def index
    flash.alert = "Order is paid"
  end

  def create
    customer = Customer.find_by(id: session[:customer_id])
    total = session[:order]['total']
    taxes = session[:order]['taxes']
    payment_intent = params[:payment_intent]
    order = Order.create(:customer_id => customer.id.to_s, :total => total.to_d, :taxes => taxes.to_d, :shipping_address => customer.default_shipping_address.to_s, :province_id => customer.province_id.to_i, :order_status_id => 1, :payment_intent => payment_intent.to_s)
    session.delete(:order)
    session.delete(:order)
    redirect_to '/order/index'
  end
end
