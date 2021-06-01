class BrandsController < ApplicationController
  def index
    @brands = Brand.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @brands.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
