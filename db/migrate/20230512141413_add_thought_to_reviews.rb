class AddThoughtToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :thought, :text
  end
end
