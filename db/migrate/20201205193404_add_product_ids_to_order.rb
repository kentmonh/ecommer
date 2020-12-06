class AddProductIdsToOrder < ActiveRecord::Migration[6.0]
  def change
    change_table :orders do |t|
      t.remove :product_ids, :quantities, :prices
      t.integer "product_ids", array: true
      t.integer "quantities", array: true
      t.float "prices", array: true
    end
  end
end
