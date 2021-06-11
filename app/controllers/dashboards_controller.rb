class DashboardsController < ApplicationController
  before_action :skip_authorization, only: []
  before_action :set_user, only: [:index, :destroy]
  before_action :set_brand, only: [:edit, :update]
  skip_after_action :verify_policy_scoped, :only => :index
  def index
    skip_authorization
   @brands = current_user.brands
  end
 def edit
    # @brand = Brand.find(params[:id])
  end

  def update
    # @brand = Brand.find(params[:id])
    @brand.update(brand_params)
    redirect_to dashboards_path
  end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Your account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_brand
    @brand = Brand.find(params[:user_id])
  end

   def brand_params
    params.permit(:status)
  end
end
