class Room < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :room_image

  with_options presence: true do
    validates :room_name, length: { maximum: 40 }
    validates :room_introduction, length: { maximum: 1000 }
    validates :genre
  end

end
