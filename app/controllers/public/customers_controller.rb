class Public::CustomersController < ApplicationController
 before_action :is_matching_login_customer, only: [:edit, :update]


  def show
   @customer = Customer.find(params[:id])
   @reviews = @customer.reviews
   
   # アクセス制御のコードを追加
    unless current_customer == @customer
      redirect_to reviews_path
    end
  end


  def edit
   is_matching_login_customer
   @customer = Customer.find(params[:id])
  end


  def update
   is_matching_login_customer
    @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
    flash[:success] = "顧客情報を更新しました"
    redirect_to customer_path(@customer)
   else
    flash.now[:error] = "顧客情報の更新に失敗しました"
    render :edit
   end
  end
  
  
  def unsubscribe
    # フォーム用のオブジェクトを作成
    @customer = Customer.new
  end

  def withdraw
  # フォームから送信されたパスワードとパスワード確認用の値を取得する
  password = params[:password]
  password_confirmation = params[:password_confirmation]
 # パスワードとパスワード確認用の値が一致しているかを確認する
   if password == password_confirmation
    # 論理削除のため、is_deletedカラムをtrueに更新する
    current_customer.update(is_deleted: true)

    # ログアウトさせる
    reset_session

    # 退会が完了した旨のメッセージを表示し、トップページへリダイレクトする
    flash[:notice] = "退会が完了しました。ご利用ありがとうございました。"
    redirect_to top_path
   else
    # パスワードとパスワード確認用の値が一致しない場合はエラーメッセージを表示する
    flash.now[:alert] = "パスワードとパスワード確認用の値が一致しません。"
    redirect_to customers_my_page_path
   end
  end
  
  
  private

   def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to top_path
    end
   end

   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :nick_name, :is_deleted)
   end

end
