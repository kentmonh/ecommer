class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def men_products
    @men_products = Product.joins(:categories).where(categories: { name: "Men" })
  end

  def view; end
end
