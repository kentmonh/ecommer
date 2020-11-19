class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.float :price
      t.float :sale_price
      t.integer :stock
      t.text :description
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
