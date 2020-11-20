class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def men_products
    @men_products = Product.joins(:categories).where(categories: { name: "Men" })
  end

  def women_products
    @women_products = Product.joins(:categories).where(categories: { name: "Women" })
  end

  def show
    @product = Product.find(params[:id])
  end
end
