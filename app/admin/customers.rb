ActiveAdmin.register Customer do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :full_name, :address, :phone, :province_id,
                orders: [:id]

  show do |customer|
    attributes_table do
      row :email
      row :full_name
      row :address
      row :phone
      row :province
      row :orders
    end
  end

  index do
    selectable_column
    column :email
    column :full_name
    column :address
    column :phone
    column :province
    column :orders
    actions
  end
end
