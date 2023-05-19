class Public::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :is_matching_login_customer, only: [:edit, :update, :destroy]

  def index
   @reviews = Review.all

  # 名前による検索
   if params[:search].present?
    @reviews = @reviews.where("name LIKE ?", "%#{params[:search]}%")
   end

  # 評価の絞り込み
   if params[:rating].present?
    @reviews = @reviews.where(rating: params[:rating])
   end

  # 金額の範囲での絞り込み
   if params[:price].present?
    case params[:price]
    when "1"
      @reviews = @reviews.where(price: 0..999)
    when "2"
      @reviews = @reviews.where(price: 1000..1999)
    when "3"
      @reviews = @reviews.where(price: 2000..2999)
    when "4"
      @reviews = @reviews.where("price >= ?", 3000)
    end
   end

   # 球場で絞り込み
  if params[:ballpark_id].present?
    @reviews = Review.where(ballpark_id: params[:ballpark_id])
  else
    @reviews = Review.all
  end



   @ballparks = Ballpark.all
  end


  def show
    @ballparks = Ballpark.all
    @comments = @review.comments
  end

  def edit
    unless current_customer == @review.customer
     redirect_to review_path
    end
  end

  def update

    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
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

  def destroy
    review.destroy
    redirect_to reviews_path
  end




  private

  def review_params
    params.require(:review).permit(:image, :name, :price, :rating, :thought, :customer_id, :ballpark_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def is_matching_login_customer
    unless current_customer == @review.customer
     redirect_to review_path
    end
  end

end
