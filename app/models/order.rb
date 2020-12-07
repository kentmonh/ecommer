class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :order_status
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  accepts_nested_attributes_for :products
end
