class BrandsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show] #device: no need to sign in
# before_action :skip_policy_scope, only: [:index] #pundit: no need to check if authorized
# before_action :skip_authorization, only: []

  def index
    @brands = Brand.all
    #@brands = policy_scope(Brand)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @markers = @flats.geocoded.map do |flat|
    @markers = @brands.geocoded.map do |brand|
      {
        lat: brand.latitude,
        lng: brand.longitude,
        info_window: render_to_string(partial: "info_window", locals: { brand: brand }),
        vegan: brand.is_vegan?
        # organic: brand.organic_value
      }
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @review = Review.new
  end
end
