class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
    @ballparks = Ballpark.all
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

  def edit
    # 編集画面の表示
  end

  def update
    if @review.update(review_params)
      redirect_to admin_review_path(@review), notice: "レビューが更新されました。"
    else
      render :edit
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:image, :name, :price, :rating, :thought, :customer_id, :ballpark_id)
  end

  def authenticate_admin!
    unless admin_signed_in?
      redirect_to top_path
    end
  end
end
