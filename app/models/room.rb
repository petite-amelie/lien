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
end
