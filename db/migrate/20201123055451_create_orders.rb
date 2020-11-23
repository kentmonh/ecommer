class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :pst
      t.float :gst
      t.float :hst
      t.float :amount
      t.text :shipping_address
      t.references :order_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
