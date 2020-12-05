class AddColumnsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :product_ids, :integer
    add_column :orders, :quantities, :integer
    add_column :orders, :prices, :float
    add_column :orders, :sub_total, :float
    add_column :orders, :tax, :float
  end
end
