class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms.with_attached_room_image       #ActiveStorageのN+1問題を解決(countの問題も解決したい)
  end

  def profile
    @user = User.find(params[:id])
  end

  def like
    @user = User.find(params[:id])
  end
end
