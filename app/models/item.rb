class Item < ApplicationRecord
  belongs_to :room
  has_one_attached :item_image
end
