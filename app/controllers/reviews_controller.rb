class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review= Review.new
  end

  def create

  end

  def edit
  end

  def update
  end


end
