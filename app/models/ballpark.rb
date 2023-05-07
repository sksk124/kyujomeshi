class Ballpark < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
