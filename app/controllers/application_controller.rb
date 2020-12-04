class ApplicationController < ActionController::Base
  helper_method :current_customer
  helper_method :logged_in?
  private

  def initialize_session
    session[:cart] ||= []
  end

  def current_customer
    Customer.find_by(id: session[:customer_id])
  end

  def logged_in?
    !current_customer.nil?
  end
end
