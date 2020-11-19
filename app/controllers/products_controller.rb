class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def view; end
end
