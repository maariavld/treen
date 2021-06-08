class DashboardsController < ApplicationController
  before_action :skip_authorization
  before_action :set_user, only: [:show, :destroy]
  def show
   @brands = current_user.brands
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
end
