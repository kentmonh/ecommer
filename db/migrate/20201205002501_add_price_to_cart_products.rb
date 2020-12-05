class AddPriceToCartProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_products, :price, :float
  end
end
