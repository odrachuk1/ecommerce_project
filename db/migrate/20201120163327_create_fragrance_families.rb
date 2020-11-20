class CreateFragranceFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :fragrance_families do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
