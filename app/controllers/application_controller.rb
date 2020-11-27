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

  # For session shopping cart
  # before_action :init_session
  # helper_method :cart

  # def init_session
  #   session[:cart] ||= []
  #   session[:quantity] ||= []
  # end

  # def cart
  #   Product.find(session[:cart])
  # end
end
