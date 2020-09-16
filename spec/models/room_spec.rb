require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
    @room.room_image = fixture_file_upload('public/images/test_image.png')
  end

  describe '個展新規登録' do
    context '新規登録がうまくいくとき' do
      it "各カラムが正しい値で入力されれば登録できる" do
        expect(@room).to be_valid
      end
      it "room_imageは空でも登録できる" do
        @room.room_image = nil
        expect(@room).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "room_nameが空では登録できない" do
        @room.room_name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("個展名を入力してください")
      end
      it "room_nameが41字以上では登録できない" do
        @room.room_name = Faker::Alphanumeric.alpha(number: 41)
        @room.valid?
        expect(@room.errors.full_messages).to include("個展名は40文字以内で入力してください")
      end
      it "room_introductionが空では登録できない" do
        @room.room_introduction = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("個展の説明を入力してください")
      end
      it "room_introductionが1001字以上では登録できない" do
        @room.room_introduction = Faker::Alphanumeric.alpha(number: 1001)
        @room.valid?
        expect(@room.errors.full_messages).to include("個展の説明は1000文字以内で入力してください")
      end
      it "genreが空では登録できない" do
        @room.genre = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("ジャンルを入力してください")
      end
      
    end
  end
end
