require 'rails_helper'
RSpec.describe GamesController, type: :request do
  describe 'GET #index' do
    before do
      FactoryBot.create :ff14
    end

    it 'リクエストが成功すること' do
      get games_url
      expect(response.status).to eq 200
    end

    it 'titleが表示されていること' do
      get games_url
      expect(response.body).to include "ff14"
    end
  end

  describe 'GET #show' do
    let(:ff14) { FactoryBot.create :ff14 }

    it 'リクエストが成功すること' do
      get games_url ff14.id
      expect(response.status).to eq 200
    end

    it 'titleが表示されていること' do
      get games_url ff14.id
      expect(response.body).to include 'ff14'
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_game_url
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    let(:ff14) { FactoryBot.create :ff14 }

    it 'リクエストが成功すること' do
      get edit_game_url ff14
      expect(response.status).to eq 200
    end

    it 'titleが表示されていること' do
      get edit_game_url ff14
      expect(response.body).to include 'ff14'
    end

    it 'platformが表示されていること' do
      get edit_game_url ff14
      expect(response.body).to include 'ps4'
    end

    it 'statusが表示されていること' do
      get edit_game_url ff14
      expect(response.body).to include 'todo'
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post games_url, params: { game: FactoryBot.attributes_for(:game) }
        expect(response.status).to eq 302
      end

      it 'titleが登録されること' do
        expect do
          post games_url, params: { game: FactoryBot.attributes_for(:game) }
        end.to change(Game, :count).by(1)
      end

      it 'リダイレクトすること' do
        post games_url, params: { game: FactoryBot.attributes_for(:game) }
        expect(response).to redirect_to Game.last
      end
    end
  end

  describe 'PUT #update' do
    let(:ff14) { FactoryBot.create :ff14 }

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        put game_url ff14, params: { game: FactoryBot.attributes_for(:ff13) }
        expect(response.status).to eq 302
      end

      it 'titleが更新されること' do
        expect do
          put game_url ff14, params: { game: FactoryBot.attributes_for(:ff13) }
        end.to change { Game.find(ff14.id).title }.from('ff14').to('ff13')
      end

      it 'リダイレクトすること' do
        put game_url ff14, params: { game: FactoryBot.attributes_for(:ff13) }
        expect(response).to redirect_to Game.last
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:game) { FactoryBot.create :game }

    it 'リクエストが成功すること' do
      delete game_url game
      expect(response.status).to eq 302
    end

    it 'titleが削除されること' do
      expect do
        delete game_url game
      end.to change(Game, :count).by(-1)
    end

    it 'game一覧にリダイレクトすること' do
      delete game_url game
      expect(response).to redirect_to(games_url)
    end
  end
end
