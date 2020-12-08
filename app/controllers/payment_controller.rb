class PaymentController < ApplicationController
  def create
    id = params[:id].to_i
    @order = Order.find(id)
    logger.debug("TEST create #{@order}")
    session[:order_id] = @order.id

    # Establish a connection with Stripe and then redirect the user to the payment screen
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          payment_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:           payment_cancel_url,
      line_items:           [
        {
          name:     "Order",
          amount:   (@order.total * 100).to_i,
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

  def success
    # id = params[:id].to_i
    # order = Order.find(id)
    # order.is_paid = true
    # order.payment_id =
    #   order.save
    logger.debug("TEST success #{session[:order_id]}")
    id = session[:order_id].to_i
    logger.debug("TEST success #{id}")
    # logger.debug("TEST success #{@payment_intent.id]}")
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    payment_intent = Stripe::PaymentIntent.retrieve(session.payment_intent)

    order = Order.find(id)
    order.is_paid = true
    order.order_status_id = 2
    order.payment_id = payment_intent.id
    order.save

    logger.debug("TEST success #{order.is_paid}")
    logger.debug("TEST success #{order.payment_id}")
  end

  def cancel
    id = session[:order_id].to_i
    order = Order.find(id)
    order.is_paid = false
    order.order_status_id = 1
    order.payment_id = nil
    order.save
  end
end
