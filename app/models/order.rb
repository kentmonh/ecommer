class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :order_status
  has_many :order_products, dependent: :destroy
end
