FactoryBot.define do
  factory :order do
    user_id                   {FactoryBot.create(:user).id}
    item_id                   {FactoryBot.create(:item).id}
  end
end
