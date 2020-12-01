class Cart < ApplicationRecord
  belongs_to :customer

  has_many :cart_products, dependent: :destroy
end
