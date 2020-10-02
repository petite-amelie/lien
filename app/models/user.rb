class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  devise :validatable, password_length: 6..128

  has_one_attached :avatar
  has_many :rooms, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_rooms, through: :likes, source: :room   #お気に入りしたroomを簡単に取得するための架空のテーブル
  has_many :orders


  with_options presence: true do
    validates :nickname, length: { maximum: 8 }
    validates :phone_number
    validates :birth
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end
  # allow_blank: trueを指定してエラーメッセージの重複を回避
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, allow_blank: true

  validates :phone_number, format:{ with: /\A\d{11}\z/ }, allow_blank: true

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }, allow_blank: true do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ン]+\z/ }, allow_blank: true do
    validates :first_name_kana
    validates :last_name_kana
  end
  # //allow_blank: trueを指定してエラーメッセージの重複を回避

  # roomに対してすでにお気に入りにしているかどうか判定
  def already_liked?(room)
    self.likes.exists?(room_id: room.id)
  end
  # //roomに対してすでにお気に入りにしているかどうか判定
end
