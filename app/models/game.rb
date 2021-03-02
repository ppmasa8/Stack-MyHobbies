class Game < ApplicationRecord
  validates :title, presence: true
  validates :platform, presence: true
  validates :status, presence: true
end
