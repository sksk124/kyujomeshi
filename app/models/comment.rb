class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :customer
end
