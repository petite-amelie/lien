class OrdersController < ApplicationController
  before_action :item_find_params, only: [:index, :create]
  before_action :deja_order, only: [:index]
  before_action :not_buy_owner, only: [:index]
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

  # すでに購入されてる場合はURL直打ちでも購入ページには飛べない
  def deja_order
    if request.referer == nil && Item.find(params[:item_id]).order != nil
      redirect_to root_path
    end
  end
  # //すでに購入されてる場合はURL直打ちでも購入ページには飛べない

  # 自分の作品の購入ページには遷移できない
  def not_buy_owner
    @room = Room.find(params[:room_id])
    if @room.user_id == current_user.id
      redirect_to root_path
    end
  end
  # //自分の作品の購入ページには遷移できない
end

