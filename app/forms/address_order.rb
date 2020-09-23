class AddressOrder

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :building_name, :house_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format:{ with: /\A[0-9]{3}-[0-9]{4}\z/ , message: "は正しくありません"}
    validates :city
    validates :house_number
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_name: building_name, house_number: house_number, user_id: user_id, order_id: order.id)
  end
end