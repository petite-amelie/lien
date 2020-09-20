class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(room_id: params[:room_id])
    redirect_to room_path(@like.room_id)
  end

  def destroy
    @like = Like.find_by(room_id: params[:room_id], user_id: current_user.id)   #roomとuserのidの組み合わせを探す
    @like.destroy
    redirect_to room_path(@like.room_id)
  end
end
