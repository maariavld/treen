class BrandsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show] #device: no need to sign in
# before_action :skip_policy_scope, only: [:index] #pundit: no need to check if authorized
# before_action :skip_authorization, only: []
before_action :params_permit, only: [:show]
before_action :set_brand_policy, only: [:show]

  def index
    @policies = Policy.all
    @brands = Brand.all

    if params[:good].present?
      good_id = Policy.find_by(title:'Good Cause').id
      brand_policy = BrandPolicy.where("policy_id = #{good_id} AND ranking >= #{params[:good].to_i}")
      @brands = @brands.where(id: brand_policy.map(&:brand_id))
    end
    if params[:fair].present?
      fair_id = Policy.find_by(title:'Fair Trade').id
      brand_policy = BrandPolicy.where("policy_id = #{fair_id} AND ranking >= #{params[:fair].to_i}")
      @brands = @brands.where(id: brand_policy.map(&:brand_id))
    end
    if params[:co2].present?
      co2_id = Policy.find_by(title:'Carbon Footprint').id
      brand_policy = BrandPolicy.where("policy_id = #{co2_id} AND ranking >= #{params[:co2].to_i}")
      @brands = Brand.where(id: brand_policy.map(&:brand_id))
    end
    if params[:organic].present?
      organic_id = Policy.find_by(title:'Organic Fabrics').id
      brand_policy = BrandPolicy.where("policy_id = #{organic_id} AND ranking >= #{params[:organic].to_i}")
      @brands = @brands.where(id: brand_policy.map(&:brand_id))
    end
    if params[:vegan].present?
      vegan_id = Policy.find_by(title:'Vegan').id
      brand_policy = BrandPolicy.where("policy_id = #{vegan_id} AND ranking >= #{params[:vegan].to_i}")
      @brands = @brands.where(id: brand_policy.map(&:brand_id))
    end
    if params[:hand2].present?
      hand2_id = Policy.find_by(title:'Second Hand').id
      brand_policy = BrandPolicy.where("policy_id = #{hand2_id} AND ranking >= #{params[:hand2].to_i}")
      @brands = @brands.where(id: brand_policy.map(&:brand_id))
    end
    @markers = @brands.geocoded.map do |brand| {
        lat: brand.latitude,
        lng: brand.longitude,
        info_window: render_to_string(partial: "info_window", locals: { brand: brand }),
        vegan: brand.is_vegan?(params[:vegan]),
        good: brand.good_cause(params[:good]),
        fairTrade: brand.fair_trade,
        co2: brand.co_2(params[:co2]),
        organic: brand.organic,
        secondHand: brand.second_hand
    }
    end
    #################################
    #search bar logic on location####
    #################################
    # if params[:query].present?
    #   @brands = Brand.near(params[:query], 10)
    #   sql_query = " \
    #     brands.address ILIKE :query \
    #     OR brands.name ILIKE :query \
    #   "
    #   @brands = Brand.where(sql_query, query: "%#{params[:query]}%")
    #   @brands = policy_scope(Brand)
    # the `geocoded` scope filters only brands with coordinates (latitude & longitude)
    #
    ##################################
    #presearch logic for refactoring##
    ##################################
    #if params[:organic].present?
    #  organic_id = Policy.find_by(title:'Organic Fabrics').id
    #  @brands = @brands.includes(brand_policies: :policy).where("brand_policies.policy_id = #{organic_id}")
    #end
    # if params[:vegan].present?
    #   @brands =  @brands.joins(brand_policies: :policy).where("policies.title = 'Vegan' AND brand_policies.ranking = #{params[:vegan].to_i}")
    # end

      # sql_query = " \
      #   policy.title IS 'vegan' \
      #   AND brand_policy.ranking ILIKE :query
      # "
      # @brands =  Brand.joins(:brand_policies, :policies).where(sql_query, query: "%#{params[:vegan].to_i}%")
  end

  def show
    @brand = Brand.find(params[:id])
    @review = Review.new
    @brand_reviews = @brand.reviews
    @average_reviews = @brand_reviews.average(:rating)
  end

  private

  def set_brand_policy
    @brand_policies = BrandPolicy.where(brand_id:params[:id])
  end

  def params_permit
    params.permit(:id)
  end

#   private

#  def policy_params
#     params.require(:policy).permit(:vegan, :good, :co2 )
#  end
end
