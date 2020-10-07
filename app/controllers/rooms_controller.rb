class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :genre]

  def index
    # @rooms   = Room.all.order("created_at DESC").with_attached_room_image
    @likes = Room.all.with_attached_room_image.sort {|a,b| b.liked_users.count <=> a.liked_users.count}   #いいね数順に並び替え
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to  new_room_item_path(@room)
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to root_path
    end
  end

  def release
    @room =  Room.find(params[:id])
    @room.released! unless @room.released?
    redirect_to  root_path
  end

  def nonrelease
    @room =  Room.find(params[:id])
    @room.nonreleased! unless @room.nonreleased?
    redirect_to root_path
  end

  def show
    @room = Room.find(params[:id])
    @items = @room.items.with_attached_item_image
  end

  def genre
    @rooms = Room.select_genre(params[:genre], params[:page])
  end

  private

  def room_params
    params.require(
      :room
    ).permit(
      :room_name, :room_introduction, :room_image, genre: []
    ).merge(
      user_id: current_user.id
    )
  end
end
