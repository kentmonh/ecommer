class CartProductsController < ApplicationController
  def create
    id = params[:id].to_i
    product = Product.find(id)
    @cart = current_cart
    @cart_product = @cart.cart_products.find { |cp| cp.product_id == id }
    if @cart_product.nil?
      @cart_product = @cart.cart_products.new(quantity: 1, product_id: id)
    else
      @cart_product.quantity = @cart_product.quantity + 1
      @cart_product.save
    end
    @cart.save
    flash[:add_cart] = "#{product.name} added to the Cart."
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    product = Product.find(id)
    @cart = current_cart
    @cart.cart_products.delete_by(product_id: id)
    @cart.save
    flash[:remove_cart] = "#{product.name} removed from the Cart."
    redirect_to carts_path
  end

  # logger.debug("TEST #{@cart_product}")
  # logger.debug("TEST #{products_hash}")

  def update
    id = params[:id].to_i
    quantity = params[:quantity][:value]
    @cart_product = @cart.cart_products.find { |cp| cp.product_id == id }
    logger.debug("TEST #{@cart_product}")
    @cart_product.quantity = quantity
    @cart_product.save
    @cart.save
    redirect_to carts_path
  end
end
