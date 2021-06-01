class Policy < ApplicationRecord
  has_many :brands_policies
  has_many :brands, through :brands_policies
end
