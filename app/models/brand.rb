class Brand < ApplicationRecord
  has_many :brand_policies
  has_many :policies, through: :brand_policies
  has_many :reviews
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def is_vegan?
    self.brand_policies.any? do |bp|
      bp.ranking >= 1 && bp.policy.title == 'Vegan'
    end
  end

  def organic_value(x)
    self.brand_policies.any? do |bp|
      bp.ranking >= x && bp.policy.title == 'Organic'
    end
  end
end
