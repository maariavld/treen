class Brand < ApplicationRecord
  has_many :brand_policies
  has_many :policies, through: :brand_policies
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
