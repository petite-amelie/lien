class RoomsController < ApplicationController
  def index
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
