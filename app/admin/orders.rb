ActiveAdmin.register Order do
  permit_params :order_status_id, order_products: %i[id order_id product_id]

  show do |order|
    attributes_table do
      row :sub_total
      row :tax
      row :total
      row :order_status
      row :products do
        order.products.map { |p| p.name }.join(", ").html_safe
      end
    end
  end
end
