class CheckoutController < ApplicationController
  def index
    @user = current_user
    @province = Province.find(current_user.province_id)
    @sub_total = sub_total
    @total = total
  end

  def update
    new_full_name = params[:full_name].to_s
    new_phone = params[:phone].to_s
    new_address = params[:address].to_s
    new_province = params[:select_province]
    current_user.full_name = new_full_name
    current_user.phone = new_phone
    current_user.address = new_address
    current_user.province_id = new_province
    current_user.save
    redirect_to checkout_index_path
  end
end
