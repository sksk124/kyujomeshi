class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
    flash[:success] = "顧客情報を更新しました"
    redirect_to admin_customer_path(@customer)
   else
    flash.now[:error] = "顧客情報の更新に失敗しました"
    render :edit
   end
  end


  private

   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :nick_name, :is_deleted)
   end

end
