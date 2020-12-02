class CartsController < ApplicationController
  def index
    @products_hash = products_hash
    @sub_total = sub_total
  end
end
