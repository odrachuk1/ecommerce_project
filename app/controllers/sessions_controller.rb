class SessionsController < ApplicationController
  def new
  end

  def create
    @customer = Customer.find_by(email: params[:email])
    if @customer && @customer.authenticate(params[:password])
        sessions[:customer_id] = @customer.id
        redirect_to root
    else
        redirect_to '/login'
    end

  end

  def login
  end
end
