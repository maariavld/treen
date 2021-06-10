class FavoriteBrandsController < ApplicationController
  before_action :skip_authorization
  before_action :set_brand

  def create
    if Favorite.create(favorited: @brand, user: current_user)
      redirect_to @brand
    else
      redirect_to @brand
    end
  end

  def destroy
    Favorite.where(favorited_id: @brand.id, user_id: current_user.id).first.destroy
    redirect_to @brand, notice: '#{@brand.name} is no longer in favourites'
  end

  private

  def set_brand
    @brand = Brand.find(params[:brand_id] || params[:id])
  end
end
