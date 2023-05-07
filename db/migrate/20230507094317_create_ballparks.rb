class CreateBallparks < ActiveRecord::Migration[6.1]
  def change
    create_table :ballparks do |t|

      t.timestamps

      #追加のテーブル
      t.string :name
      
    end
  end
end
