ActiveAdmin.register Province do
  index do
    selectable_column
    column :name
    column :pst
    column :gst
    column :hst
    actions
  end

  permit_params :name, :gst, :pst, :hst
end
