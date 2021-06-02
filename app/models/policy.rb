class Policy < ApplicationRecord
  has_many :brand_policies
  has_many :brands, through: :brand_policies
end
