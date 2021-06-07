class BrandsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show] #device: no need to sign in
# before_action :skip_policy_scope, only: [:index] #pundit: no need to check if authorized
# before_action :skip_authorization, only: []
before_action :params_permit, only: [:show]
before_action :set_brand_policy, only: [:show]

  def index
   @policies = Policy.all
    if params[:query].present?
      sql_query = " \
        brands.address ILIKE :query \
        OR brands.name ILIKE :query \
      "
      @brands = Brand.where(sql_query, query: "%#{params[:query]}%")
      # @brands = Brand.near(params[:query], 10)
    else
      @brands = Brand.all
    end
    #@brands = policy_scope(Brand)
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @markers = @flats.geocoded.map do |flat|
    @markers = @brands.geocoded.map do |brand|
      {
        lat: brand.latitude,
        lng: brand.longitude,
        info_window: render_to_string(partial: "info_window", locals: { brand: brand }),
        vegan: brand.is_vegan?,
        good: brand.good_cause,
        fairTrade: brand.fair_trade,
        co2: brand.co_2,
        organic: brand.organic,
        secondHand: brand.second_hand

      }
    end
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
end
