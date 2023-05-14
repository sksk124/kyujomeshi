class Public::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer = current_customer
   if @review.save
    flash[:success] = 'レビューを投稿しました'
    redirect_to reviews_path
   else
    Rails.logger.error @review.errors.full_messages.join(', ')
    render :new
   end
  end


  private

  def review_params
    params.require(:review).permit(:image, :name, :price, :rating, :thought, :customer_id, :ballpark_id)
  end

end
