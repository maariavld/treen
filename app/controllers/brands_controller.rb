class BrandsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show] #device: no need to sign in
# before_action :skip_policy_scope, only: [:index] #pundit: no need to check if authorized
# before_action :skip_authorization, only: []

  def index
    @policies = Policy.all
    @brands = Brand.all
    # if params[:query].present?
    #   @brands = Brand.near(params[:query], 10)
    #   sql_query = " \
    #     brands.address ILIKE :query \
    #     OR brands.name ILIKE :query \
    #   "
    #   @brands = Brand.where(sql_query, query: "%#{params[:query]}%")
    if params[:organic].present?
      organic_id = Policy.find_by(title:'Organic Fabrics').id
      @brands = @brands.includes(brand_policies: :policy).where("brand_policies.policy_id = #{organic_id}")
    end
    raise
    if params[:fair].present?
      @brands = @brands.joins(brand_policies: :policy).where("policies.title = 'Fair Trade' AND brand_policies.ranking >= #{params[:fair].to_i}")
    end
    raise
    if params[:co2].present?
      @brands = @brands.joins(brand_policies: :policy).where("policies.title = 'Carbon Footprint' AND brand_policies.ranking >= #{params[:co2].to_i}")
    end
    if params[:good].present?
      @brands = @brand.joins(brand_policies: :policy).where("policies.title = 'Good Cause' AND brand_policies.ranking >= #{params[:good].to_i}")
    end
    if params[:organic].present?
      @brands = @brands.joins(brand_policies: :policy).where("policies.title = 'Organic Fabrics' AND brand_policies.ranking >= #{params[:organic].to_i}")
    end
    # if params[:vegan].present?
    #   @brands =  @brands.joins(brand_policies: :policy).where("policies.title = 'Vegan' AND brand_policies.ranking = #{params[:vegan].to_i}")
    # end
    # if params[:hand2].present?
    #   @brands =  @brands.joins(brand_policies: :policy).where("policies.title = 'Second Hand' AND brand_policies.ranking = #{params[:hand2].to_i}")
    # end

      # find the brands where
      # in brand_policy
      # id of vegan
      # value of params[:vegan]

      # sql_query = " \
      #   policy.title IS 'vegan' \
      #   AND brand_policy.ranking ILIKE :query
      # "
      # @brands =  Brand.joins(:brand_policies, :policies).where(sql_query, query: "%#{params[:vegan].to_i}%")

      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    # if params[:co2].present?
    # if params[:good].present?
    #@brands = policy_scope(Brand)
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @markers = @flats.geocoded.map do |flat|
    @markers = @brands.geocoded.map do |brand|
      {
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
  end

  def show
    @brand = Brand.find(params[:id])
    @review = Review.new
    @brand_reviews = @brand.reviews
  end

#   private

#  def policy_params
#     params.require(:policy).permit(:vegan, :good, :co2 )
#  end
end
