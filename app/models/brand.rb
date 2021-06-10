class Brand < ApplicationRecord
  belongs_to :user, optional: true
  has_many :brand_policies
  has_many :policies, through: :brand_policies
  has_many :reviews
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def is_vegan?(value)
    self.brand_policies.any? do |bp|
      bp.ranking >= value.to_i && bp.policy.title == 'Vegan'
    end
  end

  def good_cause(value)
    self.brand_policies.any? do |bp|
      bp.ranking >= value.to_i && bp.policy.title == 'Good Cause'
    end
  end

  def fair_trade
    self.brand_policies.any? do |bp|
      bp.ranking >= 4 && bp.policy.title == 'Fair Trade'
    end
  end

  def co_2(value)
    self.brand_policies.any? do |bp|
      bp.ranking >= value.to_i && bp.policy.title == 'Carbon Footprint'
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
