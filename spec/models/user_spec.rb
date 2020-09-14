require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.avatar = fixture_file_upload('public/images/test_image.png')
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "各カラムが正しい値で入力されれば登録できる" do
        expect(@user).to be_valid
      end
      it "画像が空でも登録できる" do
        @user.avatar = nil
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "nicknameが8文字より大きいと登録できない" do
        @user.nickname = "123456789"
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームは8文字以内で入力してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(フリガナ)を入力してください")
      end
      it "first_name_kanaが平仮名だと登録できない" do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(フリガナ)は不正な値です")
      end
      it "first_name_kanaが漢字だと登録できない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(フリガナ)は不正な値です")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(フリガナ)を入力してください")
      end
      it "last_name_kanaが平仮名だと登録できない" do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(フリガナ)は不正な値です")
      end
      it "last_name_kanaが漢字だと登録できない" do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(フリガナ)は不正な値です")
      end
      it "phone_numberが空だと登録できない" do
        @user.phone_number = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号を入力してください")
      end
      it "phone_numberにハイフン(-)があると登録できない" do
        @user.phone_number = "090-1234-4567"
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "phone_numberが12桁以上だと登録できない" do
        @user.phone_number = "090123456789"
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "phone_numberが全角数字だと登録できない" do
        @user.phone_number = "０９０１２３４４５６７"
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "birthが空だと登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emaiに@が無いと登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが6文字未満だと登録できない" do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = "12345678"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが英字だけだと登録できない" do
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが全角英数字だと登録できない" do
        @user.password = "ａｂｃ１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "password_confirmationとpasswordが一致しないと登録できない" do
        @user.password_confirmation = "aaa1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end