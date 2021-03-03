require 'rails_helper'
RSpec.describe Comic, type: :model do
  describe "正常系" do
    it "すべての項目が埋まっているとき" do
      comic = Comic.new(
        year: "2003",
        title: "よつばと！",
        abstract: "不思議な外国人の女の子と父ちゃんの日常系漫画",
        status: "done",
        )
      expect(comic).to be_valid
    end
  end

  describe "異常系" do
    it "4つ空欄があるとき" do
      comic = Comic.new(
        year: nil,
        title: nil,
        abstract: nil,
        status: nil,
        )
      comic.valid?
      expect(comic.errors[:year]).to include("can't be blank")
      expect(comic.errors[:title]).to include("can't be blank")
      expect(comic.errors[:abstract]).to include("can't be blank")
      expect(comic.errors[:status]).to include("can't be blank")
    end
    it "3つ空欄があるとき" do
      comic = Comic.new(
        year: nil,
        title: "よつばと！",
        abstract: nil,
        status: nil,
        )
      comic.valid?
      expect(comic.errors[:year]).to include("can't be blank")
      expect(comic.errors[:abstract]).to include("can't be blank")
      expect(comic.errors[:status]).to include("can't be blank")
    end
    it "2つ空欄があるとき" do
      comic = Comic.new(
        year: nil,
        title: "よつばと！",
        abstract: nil,
        status: "done",
        )
      comic.valid?
      expect(comic.errors[:year]).to include("can't be blank")
      expect(comic.errors[:abstract]).to include("can't be blank")
    end
    it "1つ空欄があるとき" do
      comic = Comic.new(
        year: "2003",
        title: "よつばと！",
        abstract: nil,
        status: "done",
        )
      comic.valid?
      expect(comic.errors[:abstract]).to include("can't be blank")
    end
  end
end