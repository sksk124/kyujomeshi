class Public::ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = 'レビューを投稿しました'
      redirect_to @review
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:image, :name, :price, :rating, :thought, :customer_id, :ballpark_id)
  end

end
