class RemoveNickNameFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :nick_name, :string
  end
end
