class ItemsController < ApplicationController
  before_action :room_find_params

  def new
    @item = Item.new
    @items = @room.items.with_attached_item_image     #with_attached_item_image でN+1問題の対策
  end

  def create
    @item = @room.items.new(item_params)      #@roomに紐付いたitemを作成
    if @item.save
      redirect_to new_room_item_path(@room)   #@roomを付与してroomidを指定してリダイレクト
    else
      @items = @room.items.with_attached_item_image       #@itemsを定義しエラーを回避
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_introduction, :price,:item_image )
  end

  def room_find_params
    @room = Room.find(params[:room_id])
  end
end
