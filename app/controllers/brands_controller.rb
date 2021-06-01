class BrandsController < ApplicationController
  def index
    @brands = Brand.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @markers = @flats.geocoded.map do |flat|
    @markers = @brands.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { brand: flat })
      }
    end
  end
end
