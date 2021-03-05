require 'rails_helper'
RSpec.describe MoviesController, type: :request do
  describe 'GET #index' do
    before do
      FactoryBot.create :ghibli
    end

    it 'リクエストが成功すること' do
      get movies_url
      expect(response.status).to eq 200
    end

    it 'titleが表示されていること' do
      get movies_url
      expect(response.body).to include "耳をすませば"
    end
  end

  describe 'GET #show' do
    let(:ghibli) { FactoryBot.create :ghibli }

    it 'リクエストが成功すること' do
      get movies_url ghibli.id
      expect(response.status).to eq 200
    end

    it 'titleが表示されていること' do
      get movies_url ghibli.id
      expect(response.body).to include '耳をすませば'
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_movie_url
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    let(:ghibli) { FactoryBot.create :ghibli }

    it 'リクエストが成功すること' do
      get edit_movie_url ghibli
      expect(response.status).to eq 200
    end

    it 'yearが表示されていること' do
      get edit_movie_url ghibli
      expect(response.body).to include '1995'
    end

    it 'titleが表示されていること' do
      get edit_movie_url ghibli
      expect(response.body).to include '耳をすませば'
    end

    it 'abstractが表示されていること' do
      get edit_movie_url ghibli
      expect(response.body).to include 'ジブリの映画です'
    end

    it 'statusが表示されていること' do
      get edit_movie_url ghibli
      expect(response.body).to include 'todo'
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post movies_url, params: { movie: FactoryBot.attributes_for(:movie) }
        expect(response.status).to eq 302
      end

      it 'titleが登録されること' do
        expect do
          post movies_url, params: { movie: FactoryBot.attributes_for(:movie) }
        end.to change(Movie, :count).by(1)
      end

      it 'リダイレクトすること' do
        post movies_url, params: { movie: FactoryBot.attributes_for(:movie) }
        expect(response).to redirect_to Movie.last
      end
    end
  end

  describe 'PUT #update' do
    let(:ghibli) { FactoryBot.create :ghibli }

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        put movie_url ghibli, params: { movie: FactoryBot.attributes_for(:bttf) }
        expect(response.status).to eq 302
      end

      it 'titleが更新されること' do
        expect do
          put movie_url ghibli, params: { movie: FactoryBot.attributes_for(:bttf) }
        end.to change { Movie.find(ghibli.id).title }.from('耳をすませば').to('back to the future')
      end

      it 'リダイレクトすること' do
        put movie_url ghibli, params: { movie: FactoryBot.attributes_for(:bttf) }
        expect(response).to redirect_to Movie.last
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:movie) { FactoryBot.create :movie }

    it 'リクエストが成功すること' do
      delete movie_url movie
      expect(response.status).to eq 302
    end

    it 'titleが削除されること' do
      expect do
        delete movie_url movie
      end.to change(Movie, :count).by(-1)
    end

    it 'movie一覧にリダイレクトすること' do
      delete movie_url movie
      expect(response).to redirect_to(movies_url)
    end
  end
end