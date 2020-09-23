FactoryBot.define do
  factory :address_order do
    postal_code                 {'123-4567'}
    prefecture_id             {Faker::Number.between(from: 2, to: 48)}
    city                      {Gimei.address.city.kanji }
    building_name             {Gimei.town.katakana}
    house_number              {"11-11-11"}
    token                     {"1234567890123456789"}
    user_id                   {FactoryBot.create(:user).id}
  end
end