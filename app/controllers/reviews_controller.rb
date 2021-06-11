class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped, :only => :index
  def index
    #@reviews = Review.all
    @review = policy_scope(Review)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @brand = Brand.find(params[:brand_id])
    @review.brand = @brand
    @review.user = current_user
    if @review.save
      redirect_to brand_path(@brand)
    else
      redirect_to brand_path(@brand), notice: 'You need to specify a rating'
      # render "shared/reviewform"
    end
    authorize @review
    # @review = Review.new(review_params)
    # @review.user = current_user

    # if @review.save
    #   redirect_to @review, notice: 'Review was succesfully created'
    # else
    #   render :new
    # end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was succesfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was succesfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
