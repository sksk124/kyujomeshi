class Ballpark < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :rating, presence: true
  validates :thought, presence: true
  validates :image, presence: true
end
