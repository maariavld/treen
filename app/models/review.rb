class Review < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  validates :content, presence: true, length: { minimum: 20 }
  validates :rating, presence: true
end
