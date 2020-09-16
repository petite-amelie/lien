class Item < ApplicationRecord
  belongs_to :room
  has_one_attached :item_image

  with_options presence: true do
    validates :item_name, length: { maximum: 20 }
    validates :item_image
  end
  validates :item_introduction, length: { maximum: 100 }
  validates :price, format: { with: /\A[0-9]+\z/}
end
