class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = AddressOrder.new
  end
end
