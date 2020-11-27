class CartController < ApplicationController
  # POST /cart
  def create
    id = params[:id].to_i

    unless session[:cart].include?(id)
      session[:cart] << id
      session[:quantity] << 1
      product = Product.find(id)
      flash[:add_cart] = "#{product.name} added to the Cart."
      redirect_to root_path
    end
  end

  # DELETE /cart/:id
  def destroy
    id = params[:id].to_i
    session[:cart].delete(id)
    product = Product.find(id)
    flash[:remove_cart] = "#{product.name} removed from the Cart."
    redirect_to cart_index_path
  end

  # Show the session cart
  def index; end
end
class CartController < ApplicationController
  # POST /cart
  def create
    id = params[:id].to_i

    unless session[:cart].include?(id)
      session[:cart] << id
      session[:quantity] << 1
      product = Product.find(id)
      flash[:add_cart] = "#{product.name} added to the Cart."
      redirect_to root_path
    end
  end

  # DELETE /cart/:id
  def destroy
    id = params[:id].to_i
    session[:cart].delete(id)
    product = Product.find(id)
    flash[:remove_cart] = "#{product.name} removed from the Cart."
    redirect_to cart_index_path
  end

  # Show the session cart
  def index; end
end
