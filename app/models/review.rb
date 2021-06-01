class Review < ApplicationRecord
  belongs_to :user
  has_many :brands
end
