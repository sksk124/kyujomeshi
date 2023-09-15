class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :guest_sign_in]

  def top
    @reviews = Review.all
    @ballparks = Ballpark.all
  end

  def about
  end

  def guest_sign_in
  customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer| # guest@example.comをゲストログインのアドレスに設定
    customer.password = SecureRandom.urlsafe_base64 # ランダムでパスワードを設定
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
