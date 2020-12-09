class CheckoutController < ApplicationController
  def create
    @total = params[:total]
    @taxes = params[:taxes]
    session[:order] = { total: @total, taxes: @taxes }
    if @total.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
                     name: 'Estimated total',
                     amount: (@total.to_f * 100).to_i,
                     currency: 'cad',
                     quantity: 1
                   }],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end

  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @total = session[:order]['total'].to_d
    @taxes = session[:order]['taxes'].to_d
    redirect_to :controller => 'order', :action => 'create', :payment_intent => @payment_intent[:id], :total => @total, :taxes => @taxes
  end

  def cancel

  end
end
