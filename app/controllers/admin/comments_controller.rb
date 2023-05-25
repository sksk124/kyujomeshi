class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def create
    @comment = Comment.new(comment_params)
    review = @comment.review
    if @comment.save
      flash[:success] = "コメントが投稿されました"
    else
      flash[:error] = "コメントの投稿に失敗しました"
    end
    redirect_to review_path(review)
  end


  def destroy
    @comment = Comment.find(params[:id])
    review = @comment.review # 削除後のリダイレクト先のために関連するレビューを取得する

    if @comment.destroy
      flash[:success] = "コメントを削除しました"
    else
      flash[:error] = "コメントの削除に失敗しました"
    end

    redirect_to review_path(review)
  end


  private

  def authenticate_admin!
    unless admin_signed_in?
    redirect_to top_path
    end
  end

end
