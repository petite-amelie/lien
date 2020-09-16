class ItemsController < ApplicationController

  def new
    @item = Item.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @item = @room.items.new(item_params)
    if @item.save
      redirect_to new_room_item_path(@room)
    else
      render new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_introduction, :price,:item_image )
  end
end
