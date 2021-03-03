require 'rails_helper'
RSpec.describe Movie, type: :model do
  describe "正常系" do
    it "すべての項目が埋まっているとき" do
      movie = Movie.new(
        year: "2008",
        title: "ギラティナと氷空の花束シェイミ",
        abstract: "ポケモン映画です",
        status: "done",
        )
      expect(movie).to be_valid
    end
  end

  describe "異常系" do
    it "4つ空欄があるとき" do
      movie = Movie.new(
        year: nil,
        title: nil,
        abstract: nil,
        status: nil,
        )
      movie.valid?
      expect(movie.errors[:year]).to include("can't be blank")
      expect(movie.errors[:title]).to include("can't be blank")
      expect(movie.errors[:abstract]).to include("can't be blank")
      expect(movie.errors[:status]).to include("can't be blank")
    end
    it "3つ空欄があるとき" do
      movie = Movie.new(
        year: nil,
        title: "ギラティナと氷空の花束シェイミ",
        abstract: nil,
        status: nil,
        )
      movie.valid?
      expect(movie.errors[:year]).to include("can't be blank")
      expect(movie.errors[:abstract]).to include("can't be blank")
      expect(movie.errors[:status]).to include("can't be blank")
    end
    it "2つ空欄があるとき" do
      movie = Movie.new(
        year: nil,
        title: "ギラティナと氷空の花束シェイミ",
        abstract: nil,
        status: "done",
        )
      movie.valid?
      expect(movie.errors[:year]).to include("can't be blank")
      expect(movie.errors[:abstract]).to include("can't be blank")
    end
    it "1つ空欄があるとき" do
      movie = Movie.new(
        year: "2008",
        title: "ギラティナと氷空の花束シェイミ",
        abstract: nil,
        status: "done",
        )
      movie.valid?
      expect(movie.errors[:abstract]).to include("can't be blank")
    end
  end
end