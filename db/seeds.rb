# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Customer.create!(
  last_name: '山田',
  first_name: '花子',
  last_name_kana: 'ヤマダ',
  first_name_kana: 'ハナコ',
  email: 'hoge@example.com',
  postcode: '1500041',
  address: '東京都渋谷区神南1丁目19-11パークスウェースクエア2 4階',
  phone_number: '0368694700',
  password: 'aaaaaa',
  is_deleted: false
  )