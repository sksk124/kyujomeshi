class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.timestamps

      #追加のテーブル
      t.integer :customer_id, null: false
      t.integer :ballpark_id, null: false
      t.integer :comment_id, null: false
      t.string :nick_name, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :rating, null: false
      t.text :thougth, null: false
    end
  end
end
