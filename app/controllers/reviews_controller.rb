class ReviewsController < ApplicationController
  def new
    @serie = Serie.find(params[:series_id])
    @review = Review.new
  end

  def create
    @serie = Serie.find(params[:series_id])
    @review = Review.new(review_params)
    @review.serie = @serie
    if @review.save
      redirect_to series_path(@serie)
    else
      render :new_series_review
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to series_path(@review.serie)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
