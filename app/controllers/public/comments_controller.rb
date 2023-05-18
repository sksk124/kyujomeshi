class Public::CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "コメントが投稿されました"
    else
      flash[:error] = "コメントの投稿に失敗しました"
    end
    redirect_to review_path(@comment.review)
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

  def comment_params
    params.require(:comment).permit(:comment, :customer_id, :review_id)
  end

end
