ActiveAdmin.register Product do
  permit_params :sku, :name, :price, :sale_price, :stock, :description, :brand_id
end
