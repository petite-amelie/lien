FactoryBot.define do
  factory :room do
    room_name          {Faker::Alphanumeric.alpha(number: 40)}
    room_introduction  {Faker::Alphanumeric.alpha(number: 1000)}
    genre              {["絵画","テキスタイル"]}
    user_id            { FactoryBot.create(:user).id }
  end
end
