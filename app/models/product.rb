class Product < ApplicationRecord
  belongs_to :brand

  validates :sku, :name, presence: true
  validates :sku, :name, uniqueness: true
  validates :stock, numericality: { only_integer: true }
  validates :price, :sale_price, numericality: true
end
