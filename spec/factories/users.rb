FactoryBot.define do
  factory :user do
    nickname              {Faker::Alphanumeric.alpha(number: 8)}
    first_name            {Gimei.first.kanji}
    last_name             {Gimei.last.kanji}
    first_name_kana       {Gimei.first.katakana}
    last_name_kana        {Gimei.last.katakana}
    phone_number          {Faker::Number.number(digits: 11)}
    birth                 {"2000-11-11"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, max_length: 100)}
    password_confirmation {password}
  end
end