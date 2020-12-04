class CustomerController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @provinces = Province.all
    @customer = Customer.create(params.require(:customer).permit(:email, :password, :full_name, :default_shipping_address, :province_id))
    session[:customer_id] = @customer.id
    redirect_to root_path
  end
end
