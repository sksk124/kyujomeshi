class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reviews = Review.all
  end

  def show
    @ballparks = Ballpark.all
    @review = Review.find(params[:id])
    @comments = @review.comments

    # 投稿者での絞り込み
   if params[:customer_id].present?
     @reviews = @reviews.where(customer_id: params[:customer_id])
   end

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

  def authenticate_admin!
   unless admin_signed_in?
    redirect_to top_path
   end
  end

end
