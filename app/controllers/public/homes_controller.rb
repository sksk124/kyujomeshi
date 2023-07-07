class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :guest_sign_in]

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

  def guest_sign_in
  customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.last_name = 'Guest' # 姓を設定
    customer.first_name = 'User' # 名を設定
    customer.last_name_kana = 'ゲスト' # 姓カナを設定
    customer.first_name_kana = 'ユーザー' # 名カナを設定
    customer.nick_name = 'Guest User' # ニックネームを設定
  end

  sign_in(customer)
  redirect_to reviews_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
