require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.item_image = fixture_file_upload('public/images/test_image.png')
  end

  describe '作品新規登録' do
    context '新規登録がうまくいくとき' do
      it "各カラムが正しい値で入力されれば登録できる" do
        expect(@item).to be_valid
      end
      it "item_introductionが空でも登録できる" do
        @item.item_introduction = ""
        expect(@item).to be_valid
      end
      it "priceが空でも登録できる" do
        @item.price = ""
        expect(@item).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it "priceが全角数字だと登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は¥300〜¥9999999の半角数字で入力してください")
      end
      it "priceが文字だと登録できない" do
        @item.price = "あああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は¥300〜¥9999999の半角数字で入力してください")
      end
      it "priceが¥300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は¥300〜¥9999999の半角数字で入力してください")
      end
      it "priceが¥10000000以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は¥300〜¥9999999の半角数字で入力してください")
      end
      it "item_nameが空だと登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("作品名を入力してください")
      end
      it "item_nameが21字以上だと登録できない" do
        @item.item_name = Faker::Alphanumeric.alpha(number: 21)
        @item.valid?
        expect(@item.errors.full_messages).to include("作品名は20文字以内で入力してください")
      end
      it "item_introductionが101字以上だと登録できない" do
        @item.item_introduction = Faker::Alphanumeric.alpha(number: 101)
        @item.valid?
        expect(@item.errors.full_messages).to include("作品の説明は100文字以内で入力してください")
      end
      it "item_imageが空だと登録できない" do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("作品画像を選択してください")
      end
    end
  end
end
