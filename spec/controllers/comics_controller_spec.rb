require 'rails_helper'
RSpec.describe ComicsController, type: :request do
  describe 'GET #index' do
    before do
      FactoryBot.create :naruto
    end

    it 'リクエストが成功すること' do
      get comics_url
      expect(response.status).to eq 200
    end

    it 'titleが表示されていること' do
      get comics_url
      expect(response.body).to include "NARUTO"
    end
  end

  describe 'GET #show' do
    let(:naruto) { FactoryBot.create :naruto }

    it 'リクエストが成功すること' do
      get comics_url naruto.id
      expect(response.status).to eq 200
    end

    it 'titleが表示されていること' do
      get comics_url naruto.id
      expect(response.body).to include 'NARUTO'
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_comic_url
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    let(:naruto) { FactoryBot.create :naruto }

    it 'リクエストが成功すること' do
      get edit_comic_url naruto
      expect(response.status).to eq 200
    end

    it 'yearが表示されていること' do
      get edit_comic_url naruto
      expect(response.body).to include '1999'
    end

    it 'titleが表示されていること' do
      get edit_comic_url naruto
      expect(response.body).to include 'NARUTO'
    end

    it 'abstractが表示されていること' do
      get edit_comic_url naruto
      expect(response.body).to include '少年漫画です'
    end

    it 'statusが表示されていること' do
      get edit_comic_url naruto
      expect(response.body).to include 'todo'
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post comics_url, params: { comic: FactoryBot.attributes_for(:comic) }
        expect(response.status).to eq 302
      end

      it 'titleが登録されること' do
        expect do
          post comics_url, params: { comic: FactoryBot.attributes_for(:comic) }
        end.to change(Comic, :count).by(1)
      end

      it 'リダイレクトすること' do
        post comics_url, params: { comic: FactoryBot.attributes_for(:comic) }
        expect(response).to redirect_to Comic.last
      end
    end
  end

  describe 'PUT #update' do
    let(:naruto) { FactoryBot.create :naruto }

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        put comic_url naruto, params: { comic: FactoryBot.attributes_for(:onepiece) }
        expect(response.status).to eq 302
      end

      it 'titleが更新されること' do
        expect do
          put comic_url naruto, params: { comic: FactoryBot.attributes_for(:onepiece) }
        end.to change { Comic.find(naruto.id).title }.from('NARUTO').to('ONEPIECE')
      end

      it 'リダイレクトすること' do
        put comic_url naruto, params: { comic: FactoryBot.attributes_for(:onepiece) }
        expect(response).to redirect_to Comic.last
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:comic) { FactoryBot.create :comic }

    it 'リクエストが成功すること' do
      delete comic_url comic
      expect(response.status).to eq 302
    end

    it 'titleが削除されること' do
      expect do
        delete comic_url comic
      end.to change(Comic, :count).by(-1)
    end

    it 'comic一覧にリダイレクトすること' do
      delete comic_url comic
      expect(response).to redirect_to(comics_url)
    end
  end
end