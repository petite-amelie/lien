FactoryBot.define do
  factory :item do
    item_name         {Faker::Alphanumeric.alpha(number: 20)}
    item_introduction {Faker::Alphanumeric.alpha(number: 100)}
    price             {Faker::Number.number(digits: 5) }
    room_id           {FactoryBot.create(:room).id}
  end
end
