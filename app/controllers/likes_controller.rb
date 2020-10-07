class LikesController < ApplicationController
  before_action :room_find_params, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(room_id: params[:room_id])
  end

  def destroy
    @like = Like.find_by(room_id: params[:room_id], user_id: current_user.id)   #roomとuserのidの組み合わせを探す
    @like.destroy
  end

  private

  def room_find_params
    @room = Room.find(params[:room_id])
  end

end
