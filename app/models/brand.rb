class Brand < ApplicationRecord
  has_many :brand_policies
  has_many :policies, through: :brand_policies
  has_one_attached :photo
end
