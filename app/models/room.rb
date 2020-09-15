class Room < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :room_image

  with_options presence: true do
    validates :room_name
    validates :room_introduction
    validates :genre
  end

end
