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
    # ジャンル別にレコードを取得
    if params[:genre].include?("絵画")
      @rooms = Room.where('genre like ?','%絵画%').order("created_at DESC").with_attached_room_image.paginate(page: params[:page], per_page: 12)
    elsif params[:genre].include?("テキスタイル")
      @rooms = Room.where('genre like ?','%テキスタイル%').order("created_at DESC").with_attached_room_image.paginate(page: params[:page], per_page: 12)
    elsif params[:genre].include?("写真")
      @rooms = Room.where('genre like ?','%写真%').order("created_at DESC").with_attached_room_image.paginate(page: params[:page], per_page: 12)
    elsif params[:genre].include?("彫刻")
      @rooms = Room.where('genre like ?','%彫刻%').order("created_at DESC").with_attached_room_image.paginate(page: params[:page], per_page: 12)
    elsif params[:genre].include?("書道")
      @rooms = Room.where('genre like ?','%書道%').order("created_at DESC").with_attached_room_image.paginate(page: params[:page], per_page: 12)
    end
    # //ジャンル別にレコードを取得
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
