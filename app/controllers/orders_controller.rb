class OrdersController < ApplicationController
  def index
    @orders = Order.where("customer_id = ?", current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where("order_id = ?", params[:id])
  end

  def create
    @customer = current_user

    @order = @customer.orders.create(
      sub_total:       sub_total,
      total:           total,
      tax:             tax,
      is_paid:         false,
      address:         @customer.address,
      province_id:     @customer.province_id,
      customer_id:     @customer.id,
      order_status_id: 1
    )

    @cart = Cart.where("customer_id = ?", @customer.id)
    @cart_products = CartProduct.where("cart_id = ?", @cart.ids)

    @cart_products.each do |cp|
      @order_product = OrderProduct.create(
        quantity:   cp.quantity,
        price:      cp.price,
        order_id:   @order.id,
        product_id: cp.product_id
      )
    end

    @cart_products.each do |cp|
      current_cart.cart_products.delete_by(product_id: cp.product_id)
    end
    @cart.save

    redirect_to orders_path
  end
end
