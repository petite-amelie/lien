class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms.with_attached_room_image       #ActiveStorageのN+1問題を解決(countの問題も解決したい)
  end
end
