class PaymentController < ApplicationController
  def create
    id = params[:id].to_i
    order = Order.find(id)
    logger.debug("TEST #{order.total}")

    # Establish a connection with Stripe and then redirect the user to the payment screen
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          payment_success_url,
      cancel_url:           payment_cancel_url,
      line_items:           [
        {
          name:     "Order",
          amount:   (order.total * 100).to_i,
          currency: "cad",
          quantity: 1
        }
      ]
    )

    respond_to do |format|
      # format.html
      format.js # render app/views/payment/create.js.erb
    end
  end

  def success; end

  def cancel; end
end
