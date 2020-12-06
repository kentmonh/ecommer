class ChangeColumnsToArray < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :product_ids, :product_ids_text
    rename_column :orders, :quantities, :quantities_text
    rename_column :orders, :prices, :prices_text
    add_column :orders, :product_ids, :integer, default: []
    add_column :orders, :quantities, :integer, default: []
    add_column :orders, :prices, :integer, default: []

    orders = Order.all
    orders.each do |o|
      o.product_ids = convert_to_array(o.product_ids_text)
      o.quantities = convert_to_array(o.quantities_text)
      o.prices = convert_to_array(o.prices_text)
      o.save
    end

    remove_column :orders, :product_ids_text
    remove_column :orders, :quantities_text
    remove_column :orders, :prices_text
  end

  private

  def convert_to_array(string)
    string.split(",") if string.present? && string.include?(",")
  end
end
