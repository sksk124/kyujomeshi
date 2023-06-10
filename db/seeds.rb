# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
customers = Customer.create!(
  [
    { id: 0, last_name: '管理者', first_name: '管理者', last_name_kana: 'カンリシャ', first_name_kana: 'カンリシャ', email: 'admin@example.com', password: '01248929', nick_name: '管理者', is_deleted: false },
    { id: 1, last_name: '球場', first_name: '太郎', last_name_kana: 'キュウジョウ', first_name_kana: 'タロウ', email: 'kyujo1@example.com', password: '12345678', nick_name: '球場くん', is_deleted: false },
    { id: 2, last_name: '球場', first_name: '花子', last_name_kana: 'キュウジョウ', first_name_kana: 'ハナコ', email: 'kyujo2@example.com', password: '23456789', nick_name: '球場さん', is_deleted: false },
  ]
)

admin = Admin.create!(
  [
    { email: 'admin@example.com', password: '01248929' }
  ]
)
