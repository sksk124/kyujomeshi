class Public::HomesController < ApplicationController
  def top
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

   @ballparks = Ballpark.all
  end

  def about
  end



end
