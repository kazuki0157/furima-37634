class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_shipping_info = OrderShippingInfo.new

    redirect_to root_path if current_user.id == @item.user_id || Order.exists?(item_id: @item.id)
  end

  def create
    @order_shipping_info = OrderShippingInfo.new(order_params)
    if @order_shipping_info.valid?
      pay_item
      @order_shipping_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_info).permit(:zip, :ken_name_id, :city_name, :address, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
