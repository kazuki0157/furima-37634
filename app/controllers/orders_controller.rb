class OrdersController < ApplicationController
  before_action :order_params, only: :create

  def index
    @item = Item.find(params[:item_id])
    @order_shipping_info = OrderShippingInfo.new
  end

  def create
    @order_shipping_info = OrderShippingInfo.new(order_params)
    if @order_shipping_info.valid?
      pay_item
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  def order_params
    params.require(:order_shipping_info).permit(:zip, :ken_name_id, :city_name, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end