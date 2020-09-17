FactoryBot.define do
  factory :room do
    room_name          {Faker::Alphanumeric.alpha(number: 40)}
    room_introduction  {"room_spec.rbにて改めて代入します"}  #items.rbでFactoryBotでroom_idを生成する際にroom_introductionがValueTooLongエラーになる為
    genre              {["絵画","テキスタイル"]}
    user_id            { FactoryBot.create(:user).id }
  end
end
