class OrdersController < ApplicationController
  def index
    @orders = Order.where("customer_id = ?", current_customer.id)
    logger.debug("TEST #{@orders}")
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @customer = current_customer
    @product_ids = []
    @quantities = []
    @prices = []
    @cart = Cart.where("customer_id = ?", @customer.id)
    @cart_products = CartProduct.where("cart_id = ?", @cart.ids)
    @cart_products.each do |cp|
      @product_ids << cp.product_id
      @quantities << cp.quantity
      @prices << cp.price
    end
    @tax = total - sub_total

    @order = current_customer.orders.create(
      product_ids:     @product_ids,
      quantities:      @quantities,
      prices:          @prices,
      sub_total:       sub_total,
      total:           total,
      tax:             @tax,
      address:         @customer.address,
      province_id:     @customer.province_id,
      customer_id:     @customer.id,
      order_status_id: 1
    )
  end
end
