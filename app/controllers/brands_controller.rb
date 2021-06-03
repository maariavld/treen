class BrandsController < ApplicationController
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
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @markers = @flats.geocoded.map do |flat|
    @markers = @brands.geocoded.map do |brand|
      {
        lat: brand.latitude,
        lng: brand.longitude,
        info_window: render_to_string(partial: "info_window", locals: { brand: brand })
      }
    end
  end

  def show
    @brand = Brand.find(params[:id])
  end
end
