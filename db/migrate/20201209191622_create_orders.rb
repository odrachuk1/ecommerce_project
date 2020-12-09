class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.decimal :total
      t.decimal :taxes
      t.string :shipping_address
      t.integer :province_id
      t.integer :order_status_id

      t.timestamps
    end
  end
end
