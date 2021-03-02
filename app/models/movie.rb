class Movie < ApplicationRecord
  validates :year, presence: true
  validates :title, presence: true
  validates :abstract, presence: true
  validates :status, presence: true
end
