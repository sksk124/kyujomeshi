class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :customer

  validates :comment, presence: true
end