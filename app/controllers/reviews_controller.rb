class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    #@reviews = Review.all
    @review = policy_scope(Review)
  end

  def new
    @review= Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    authorize @review

    if @review.save
      redirect_to @review, notice: 'Review was succesfully created'
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
    params.require(:review).permit(:content)
  end
end
