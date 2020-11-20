ActiveAdmin.register Product do
  permit_params :name, :description, :price, :volume, :image, :stock_amount, :sale, :fragrance_family_id, :category_id, :brand_id
end
