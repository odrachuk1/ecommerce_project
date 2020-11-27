ActiveAdmin.register Product do
  permit_params :name, :description, :price, :volume, :image, :stock_amount, :sale, :fragrance_family_id, :category_id, :brand_id, :image

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
