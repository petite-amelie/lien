require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  
  before do
    @a_o = FactoryBot.build(:address_order)
  end


  describe '購入機能' do
    context '購入がうまくいく時' do
      it '全て値が正しく存在すれば登録できる' do
        expect(@a_o).to be_valid
      end
      it '建物名が空でも登録できる' do
        @a_o.building_name = ""
        expect(@a_o).to be_valid
      end
    end

    context '購入がうまくいかない時' do
      it '郵便番号が空では登録できない' do
        @a_o.postal_code = ""
        @a_o.valid?
        expect(@a_o.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @a_o.postal_code = "1234567"
        @a_o.valid?
        expect(@a_o.errors.full_messages).to include("郵便番号は正しくありません")
      end
      it '郵便番号は全角数字だと登録できない' do
        @a_o.postal_code = "１２３４５６７"
        @a_o.valid?
        expect(@a_o.errors.full_messages).to include("郵便番号は正しくありません")
      end
      it '市区町村が空では登録できない' do
        @a_o.city = ""
        @a_o.valid?
        expect(@a_o.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では登録できない' do
        @a_o.house_number = ""
        @a_o.valid?
        expect(@a_o.errors.full_messages).to include("番地を入力してください")
      end
      it 'トークンが空では登録できない' do
        @a_o.token = ""
        @a_o.valid?
        expect(@a_o.errors.full_messages).to include("トークンを入力してください")
      end
      it '都道府県を選択しないと登録できない' do
        @a_o.prefecture_id = 1
        @a_o.valid?
        expect(@a_o.errors.full_messages).to include("都道府県を選択してください")
      end
    end

  end

end