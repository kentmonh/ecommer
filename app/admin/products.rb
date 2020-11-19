ActiveAdmin.register Product do
  permit_params :sku, :name, :price, :sale_price, :stock, :description, :brand_id, :image, category_ids: []

  index do
    selectable_column
    column :name
    column :price
    column :sale_price
    column :stock
    column :brand
    column :categories do |perfume|
      perfume.categories.map { |p| p.name }.join(", ").html_safe
    end
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base

    f.inputs do
      f.inputs

      f.input :category_ids, as: :check_boxes, collection: Category.all

      f.input :image, as: :file
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
