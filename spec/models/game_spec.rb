require 'rails_helper'
RSpec.describe Game, type: :model do
  describe "正常系" do
    it "すべての項目が埋まっているとき" do
      game = Game.new(
        title: "ff14",
        platform: "ps4",
        status: "todo",
      )
      expect(game).to be_valid
    end
  end

  describe "異常系" do
    it "3つ空欄があるとき" do
      game = Game.new(
        title: nil,
        platform: nil,
        status: nil,
        )
      game.valid?
      expect(game.errors[:title]).to include("can't be blank")
      expect(game.errors[:platform]).to include("can't be blank")
      expect(game.errors[:status]).to include("can't be blank")
    end
    it "2つ空欄があるとき" do
      game = Game.new(
        title: "ff14",
        platform: nil,
        status: nil,
        )
      game.valid?
      expect(game.errors[:platform]).to include("can't be blank")
      expect(game.errors[:status]).to include("can't be blank")
    end
    it "1つ空欄があるとき" do
      game = Game.new(
        title: "ff14",
        platform: nil,
        status: "todo",
        )
      game.valid?
      expect(game.errors[:platform]).to include("can't be blank")
    end
  end
end