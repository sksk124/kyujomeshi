class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
   @review = Review.new(review_params)
   if @review.save
    flash[:success] = 'レビューを投稿しました'
    redirect_to admin_reviews_path
   else
    flash.now[:danger] = 'レビューの投稿に失敗しました'
    render :new
   end
  end



  private

  def review_params
    params.require(:review).permit(:image, :name, :price, :rating, :thought, :customer_id, :ballpark_id)
  end

end
