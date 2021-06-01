class Brand < ApplicationRecord
  has_many :brands_policies
  has_many :policies, through: brands_policies
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
