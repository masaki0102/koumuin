require 'rails_helper'

RSpec.describe Exam, type: :model do
  before do
    @exam = FactoryBot.build(:exam)
  end
  describe '試験情報新規登録' do
    context '登録が上手くいくとき' do
      it 'category_id、date、ageが存在すれば登録できる' do
        expect(@exam).to be_valid
      end
    end
    context '登録が上手くいかないとき' do
      it 'category_idが未選択では登録できない' do
        @exam.category_id = 1
        @exam.valid?
        expect(@exam.errors.full_messages).to include('Category must be other than 1')
      end
      it 'dateが空では登録できない' do
        @exam.date = nil
        @exam.valid?
        expect(@exam.errors.full_messages).to include("Date can't be blank")
      end
      it 'ageが空では登録できない' do
        @exam.age = nil
        @exam.valid?
        expect(@exam.errors.full_messages).to include("Age can't be blank")
      end
      it 'governmentとアソシエーションがないと登録できない' do
        @exam.government = nil
        @exam.valid?
        expect(@exam.errors.full_messages).to include('Government must exist')
      end
    end
  end
end
