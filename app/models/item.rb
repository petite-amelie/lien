class Item < ApplicationRecord
  belongs_to :room
  has_one_attached :item_image
  has_one :order

  with_options presence: true do
    validates :item_name, length: { maximum: 20 }
  end
  
  validates :item_image, presence: {message: "を選択してください"}
  validates :item_introduction, length: { maximum: 100 }

  #priceが空の場合は適用しない
  validates :price, format: { with: /\A[0-9]+\z/}, unless: :null_true,
            :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999, message: "は¥300〜¥9999999の半角数字で入力してください" }
  #//priceが空の場合は適用しない

  # 上部で使用するメソッド定義
  def null_true
    price.blank?
  end
  # //上部で使用するメソッド定義

  # 検索用のsearchメソッド定義
  def self.search(word)
    @item = Item.where("item_name LIKE?","%#{word}%")
        .or(Item.where("item_introduction LIKE?","%#{word}%"))
  end
  # //検索用のsearchメソッド定義
end
