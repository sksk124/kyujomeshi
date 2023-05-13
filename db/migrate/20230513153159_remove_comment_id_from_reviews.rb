class RemoveCommentIdFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :comment_id, :integer
  end
end
