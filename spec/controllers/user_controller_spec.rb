require 'rails_helper'
RSpec.describe UserController, type: :controller do
  describe "#index" do
    it "正常にレスポンスを返すこと" do
      get :index
      expect(response.status).to eq 200
    end
  end
end