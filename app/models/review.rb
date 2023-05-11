class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :ballpark
  has_many :comments, dependent: :destroy
  has_one_attached :image
end
