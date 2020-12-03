class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :total
      t.text :address
      t.integer :province_id
      t.references :customer, null: false, foreign_key: true
      t.references :order_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
