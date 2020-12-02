class ApplicationController < ActionController::Base
  # For deveise register
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = %i[full_name address phone province_id email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  before_action :current_cart
  helper_method :products_hash

  def current_user
    @current_user = current_customer if customer_signed_in?
  end

  def current_cart
    if customer_signed_in?
      if current_customer.cart.nil?
        @cart = Cart.create(customer_id: current_customer.id)
        current_customer.cart = @cart
        current_customer.save
      else
        @cart = current_customer.cart
      end
    else
      session[:cart] = Cart.new
      @cart = session[:cart]
    end
    @cart
  end

  def products_hash
    @products_hash = current_cart.cart_products.group(:product_id).sum(:quantity)
  end
end
