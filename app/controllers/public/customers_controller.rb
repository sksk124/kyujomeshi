class Public::CustomersController < ApplicationController
 before_action :is_matching_login_customer, only: [:edit, :update]


  def show
   @customer = Customer.find(params[:id])
   @reviews = @customer.reviews
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
