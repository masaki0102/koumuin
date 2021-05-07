require 'rails_helper'

RSpec.describe Government, type: :model do
  before do
    @government = FactoryBot.build(:government)
  end
  describe '自治体新規登録' do
    context '新規登録が上手くいくとき' do
      it 'name、email、image、password、password_confirmationが存在すれば登録できる' do
        expect(@government).to be_valid
      end
    end
    context '新規登録が上手くいかないとき' do
      it 'nameが空では登録できない' do
        @government.name = ''
        @government.valid?
        expect(@government.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @government.email = ''
        @government.valid?
        expect(@government.errors.full_messages).to include("Email can't be blank")
      end
      it 'imageが空では登録できない' do
        @government.image = nil
        @government.valid?
        expect(@government.errors.full_messages).to include("Image can't be blank")
      end
      it 'passwordが空では登録できない' do
        @government.password = ''
        @government.valid?
        expect(@government.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @government.password = '12345'
        @government.password_confirmation = '12345'
        @government.valid?
        expect(@government.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password_confirmationがpasswordと不一致では登録できない' do
        @government.password = '123456'
        @government.valid?
        expect(@government.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
