require 'rails_helper'

RSpec.describe "Exams", type: :system do
  before do
    @government = FactoryBot.create(:government)
    @exam_age = Random.rand(18..60)
  end
  context '試験情報登録ができるとき'do
    it 'ログインした自治体は新規投稿できる' do
      # トップページに移動する
      visit root_path
      # 試験情報登録ページへのリンクがあることを確認する
      expect(page).to have_content('試験情報登録')
      # 試験情報登録ページに移動する
      visit new_exam_path
      # フォームに情報を入力する
      # 送信するとExamモデルのカウントが1上がることを確認する
      # 試験情報ページに遷移することを確認する
      # トップページに遷移する
      #  試験情報ページには先ほど登録した内容の試験情報が存在することを確認する（職種）
      #  試験情報ページには先ほど登録した内容の試験情報が存在することを確認する（年齢）
    end
  end
  context '試験情報登録ができないとき'do
    it 'ログインしていないと試験情報登録ページに遷移できない' do
      # トップページに遷移する
      # 試験情報登録ページへのリンクがない
    end
  end
  
  end