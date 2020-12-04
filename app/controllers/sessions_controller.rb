class SessionsController < ApplicationController
  def new
  end

  def create
    @customer = Customer.find_by(email: params[:email])
    if @customer && @customer.authenticate(params[:password])
        reset_session
        session[:customer_id] = @customer.id
        redirect_to root_path
    else
        redirect_to '/login'
    end

  end

  def login
  end

  def destroy
    session.delete(:customer_id)
    @customer = nil
    redirect_to root_path
  end

end
