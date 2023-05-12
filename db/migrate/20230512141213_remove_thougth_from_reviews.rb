class RemoveThougthFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :thougth, :text
  end
end
