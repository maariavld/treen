class BrandsController < ApplicationController
  def index
    @brands = Brand.all

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
  end
end
