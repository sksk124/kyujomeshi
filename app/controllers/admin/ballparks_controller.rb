class Admin::BallparksController < ApplicationController

  def index
   @ballpark = Ballpark.new
   @ballparks = Ballpark.all
  end

  def edit
   @ballpark = Ballpark.find(params[:id])
  end

  def create
    @ballpark = Ballpark.new(ballpark_params)
    if @ballpark.save
      redirect_to admin_ballparks_path, notice: '新しい球場を登録しました'
    else
      render :new
    end
  end

  def update
    @ballpark = Ballpark.find(params[:id])
   if @ballpark.update(ballpark_params)
    flash[:success] = "球場情報を更新しました"
    redirect_to admin_ballparks_path
   else
    flash.now[:error] = "球場情報の更新に失敗しました"
    render :edit
   end
  end

  def destroy
   @ballpark = Ballpark.find(params[:id])
   @ballpark.destroy
   flash[:success] = "球場情報を削除しました"
   redirect_to admin_ballparks_path
  end


  private

  def ballpark_params
    params.require(:ballpark).permit(:name)
  end

end
