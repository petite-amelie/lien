class Room < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :room_image
  has_many :likes
  has_many :liked_users, through: :likes, source: :user   #お気に入りしたuserを簡単に取得するための架空のテーブル

  with_options presence: true do
    validates :room_name, length: { maximum: 40 }
    validates :room_introduction, length: { maximum: 1000 }
    validates :genre
  end
  enum status:{nonreleased: 0, released: 1}

  # 検索用のseacrメソッドの定義
  def self.search(word)
    @room = Room.where("room_name LIKE?","%#{word}%")
        .or(Room.where("room_introduction LIKE?","%#{word}%"))
  end
  # //検索用のseacrメソッドの定義

  def self.select_genre(genre, page)
    # ジャンル別にレコードを取得
    if genre.include?("絵画")
      @rooms = Room.where('genre like ?','%絵画%').order("created_at DESC").with_attached_room_image.paginate(page: page, per_page: 12)
    elsif genre.include?("テキスタイル")
      @rooms = Room.where('genre like ?','%テキスタイル%').order("created_at DESC").with_attached_room_image.paginate(page: page, per_page: 12)
    elsif genre.include?("写真")
      @rooms = Room.where('genre like ?','%写真%').order("created_at DESC").with_attached_room_image.paginate(page: page, per_page: 12)
    elsif genre.include?("彫刻")
      @rooms = Room.where('genre like ?','%彫刻%').order("created_at DESC").with_attached_room_image.paginate(page: page, per_page: 12)
    elsif genre.include?("書道")
      @rooms = Room.where('genre like ?','%書道%').order("created_at DESC").with_attached_room_image.paginate(page: page, per_page: 12)
    end
    # //ジャンル別にレコードを取得
  end
end
