class FavoriteBrandsController < ApplicationController
  before_action :skip_authorization
  before_action :set_brand
  before_action :favorite_params, only: [:create, :destroy]

  def create
    if Favorite.create(favorited: @brand, user: current_user)
      redirect_to @brand
    else
      redirect_to @brand
    end
  end

  def destroy
    Favorite.where(favorited_id: @brand.id, user_id: current_user.id).first.destroy
    redirect_to @brand
  end

  private

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

  def favorite_params
    params.permit(:brand_id, :user_id)
  end
end
