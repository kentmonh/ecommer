class CartController < ApplicationController
  # POST /cart
  def create
    id = params[:id].to_i
    unless session[:cart].include?(id)
      session[:cart] << id
      flash[:add_cart] = "Item added to the Cart."
      redirect_to root_path
    end
  end

  # DELETE /cart/:id
  def destroy; end
end
