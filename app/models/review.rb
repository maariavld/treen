class Review < ApplicationRecord
  belongs_to :users
  belongs_to :brands
end