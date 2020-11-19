ActiveAdmin.register Product do
  permit_params :sku, :name, :price, :sale_price, :stock, :description, :brand_id, :image

  form do |f|
    f.semantic_errors # shows errors on :base

    f.inputs do
      f.inputs
      f.input :image, as: :file
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
