class OrdersController < ApplicationController
  before_action :item_find_params, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
    @order = AddressOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = AddressOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:address_order).permit(:token, :postal_code, :prefecture_id, :city, :building_name, :house_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def item_find_params
    @item = Item.find(params[:item_id])
  end
end
