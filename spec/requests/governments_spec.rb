require 'rails_helper'
describe GovernmentsController, type: :request do

  before do
    @government = FactoryBot.create(:government)
    
  end

  describe 'indexアクション GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに登録済みの自治体の名前のテキストが存在する' do 
      get root_path
      expect(response.body).to include(@government.name)
    end
    it 'indexアクションにリクエストするとレスポンスに登録済みの自治体の画像が存在する' do 
      get root_path
      expect(response.body).to include('test_image')
     end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
      get root_path
      expect(response.body).to include('検索')
    end
  end

  describe 'showアクション GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get government_path(@government)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに試験情報が存在する' do 
      get government_path(@government)
      expect(response.body).to include("#{@government.name}の試験情報")  
    end
  end

end
