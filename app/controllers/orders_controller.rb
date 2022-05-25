class OrdersController < ApplicationController
  before_action :order_params, only: :create

  def index
    @item = Item.find(params[:item_id])
    @order_shipping_info = OrderShippingInfo.new
  end

  def create
    @order_shipping_info = OrderShippingInfo.new(order_params)
    if @order_shipping_info.valid?
      @order_shipping_info.save
      redirect_to root_path
    else
      binding.pry
      render :index
    end

  end

  def order_params
    #binding.pry
    params.require(:order_shipping_info).permit(:zip, :ken_name_id, :city_name, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
