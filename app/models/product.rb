class Product < ApplicationRecord
  belongs_to :brand

  has_many :product_categories
  has_many :categories, through: :product_categories
  accepts_nested_attributes_for :product_categories, allow_destroy: true

  has_one_attached :image

  validates :sku, :name, presence: true
  validates :sku, :name, uniqueness: true
  validates :stock, numericality: { only_integer: true }
  validates :price, :sale_price, numericality: true
end
