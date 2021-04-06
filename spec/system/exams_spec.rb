require 'rails_helper'

RSpec.describe "Exams", type: :system do
  before do
    @government = FactoryBot.create(:government)
    @exam_age = Random.rand(18..60)
  end
  context '試験情報登録ができるとき'do
    it 'ログインした自治体は新規投稿できる' do
      # ログインする
      visit new_government_session_path
      fill_in 'Email', with: @government.email
      fill_in 'Password', with: @government.password
      find('input[name="commit"]').click
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # 試験情報登録ページへのリンクがあることを確認する
      expect(page).to have_content('試験情報登録')
      # 試験情報登録ページに移動する
      visit new_exam_path
      # フォームに情報を入力する
      select "事務", from: "職種"
      select '2021', from: 'exam[date(1i)]'
      select '12', from: 'exam[date(2i)]'
      select '1', from: 'exam[date(3i)]'
      fill_in '年齢制限', with: @exam_age
      # 送信するとExamモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Exam.count }.by(1)
      # 試験情報ページに遷移することを確認する
      expect(current_path).to eq(government_path(@government.id))
      #  試験情報ページには先ほど登録した内容の試験情報が存在することを確認する（年齢）
      expect(page).to have_content(@exam_age)

    end
  end
  context '試験情報登録ができないとき'do
    it 'ログインしていないと試験情報登録ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 試験情報登録ページへのリンクがない
      expect(page).to have_no_content('試験情報登録')
      # 試験情報登録ページへに移動しようとするとログインページへ遷移する
      visit new_exam_path
      expect(current_path).to eq(new_government_session_path)
    end
  end
  
end