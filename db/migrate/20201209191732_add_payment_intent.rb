class AddPaymentIntent < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :payment_intent, :string
  end
end
