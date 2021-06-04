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

  def good_cause
    self.brand_policies.any? do |bp|
      bp.ranking >= 3 && bp.policy.title == 'Good Cause'
    end
  end

  def fair_trade
    self.brand_policies.any? do |bp|
      bp.ranking >= 4 && bp.policy.title == 'Fair Trade'
    end
  end

  def co_2
    self.brand_policies.any? do |bp|
      bp.ranking >= 4 && bp.policy.title == 'Carbon Footprint'
    end
  end

  def organic
    self.brand_policies.any? do |bp|
      bp.ranking >= 4 && bp.policy.title == 'Organic Fabrics'
    end
  end

  def second_hand
    self.brand_policies.any? do |bp|
      bp.ranking >= 3 && bp.policy.title == 'Second Hand'
    end
  end

end
