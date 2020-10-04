class SearchesController < ApplicationController

  def search
    @range = params[:range]
    word = params[:word]

    if @range == "1"
      @user = User.search(word)
      @word = word
    elsif @range == "2"
      @item = Item.includes(:room).search(word)
      @word = word
    else
      @room = Room.search(word)
      @word = word
    end
  end
end
