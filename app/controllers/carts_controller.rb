class CartsController < ApplicationController
  # current_cart = current_customer.cart

  def index
    @products_hash = products_hash
    @product_ids_array = @products_hash.keys
    @cart_products = Product.find(@product_ids_array)
  end
end
