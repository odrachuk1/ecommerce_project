class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password
      t.string :full_name
      t.text :default_shipping_address

      t.timestamps
    end
  end
end
