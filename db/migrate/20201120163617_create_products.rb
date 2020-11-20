class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :volume
      t.string :image
      t.integer :stock_amount
      t.decimal :sale
      t.integer :fragrance_family_id
      t.integer :category_id
      t.integer :brand_id

      t.timestamps
    end
  end
end
