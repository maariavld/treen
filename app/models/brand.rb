class Brand < ApplicationRecord
  has_many :brands_policies
  has_many :policies, through: :brands_policies
  has_one_attached :photo
end
