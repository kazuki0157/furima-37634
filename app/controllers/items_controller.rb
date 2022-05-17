class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    #binding.pry
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id, :pay_for_shipping_id, :ken_name_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

end
