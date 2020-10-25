# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Customer.create!(
  id: 1,
  last_name: '山田',
  first_name: '花子',
  last_name_kana: 'ヤマダ',
  first_name_kana: 'ハナコ',
  email: 'hoge@example.com',
  postcode: 1500041,
  address: '東京都渋谷区神南1丁目19-11パークスウェースクエア2 4階',
  phone_number: '0368694700',
  password: 'aaaaaa',
  is_deleted: false
  )

  Admin.create!(
    email: 'admin@admin.com',
    password: 'adminadmin'
    )


  Order.create!(
    id: 1,
    customer_id: 1,
    postcode: 1500041,
    address: '東京都渋谷区神南1丁目19-11パークスウェースクエア2 4階',
    name: '山田花子',
    shipping_cost: 800,
    payment_method: 1,
    total_payment: 800,
    status: 0
    )


  Genre.create!(
    id: 1,
    name: "ケーキ",
    is_active: true
    )
  Genre.create!(
    id: 2,
    name: "プリン",
    is_active: true
    )
  Genre.create!(
    id: 3,
    name: "焼き菓子",
    is_active: true
    )
  Genre.create!(
    id: 4,
    name: "キャンディ",
    is_active: true
    )


  Product.create!(
  genre_id: 1,
  image_id: '',
  name: 'イチゴケーキ',
  introduction: 'イチゴケーキです。',
  non_taxed_price: 1000,
  is_active: true
  )

  Product.create!(
  genre_id: 1,
  image_id: '',
  name: 'バースデーケーキ',
  introduction: 'バースデーケーキです。',
  non_taxed_price: 3000,
  is_active: true
  )

  Product.create!(
  name: 'ショートケーキ',
  genre_id: 1,
  image_id: '',
  introduction: 'ショートケーキです。',
  non_taxed_price: 100,
  is_active: 'true'
  )

  Product.create!(
  name: 'チーズケーキ',
  genre_id: '1',
  image_id: '',
  introduction: 'チーズケーキです。',
  non_taxed_price: '800',
  is_active: 'true'
  )

  Product.create!(
  name: 'チョコケーキ',
  genre_id: '1',
  image_id: '',
  introduction: 'チョコケーキです',
  non_taxed_price: '900',
  is_active: 'true'
  )

  Product.create!(
  name: 'ホールケーキ',
  genre_id: '1',
  image_id: '',
  introduction: 'ホールケーキです',
  non_taxed_price: '1200',
  is_active: 'true'
  )

  Product.create!(
  name: 'シフォンケーキ',
  genre_id: '1',
  image_id: '',
  introduction: 'シフォンケーキです',
  non_taxed_price: '700',
  is_active: 'true'
  )

  Product.create!(
  name: 'マフィン',
  genre_id: '2',
  image_id: '',
  introduction: 'マフィンです',
  non_taxed_price: '500',
  is_active: 'true'
  )

  Product.create!(
  name: 'マカロン',
  genre_id: '2',
  image_id: '',
  introduction: 'マカロンです',
  non_taxed_price: '500',
  is_active: 'true'
  )

  Product.create!(
  name: 'クッキー',
  genre_id: '2',
  image_id: '',
  introduction: '2222',
  non_taxed_price: '400',
  is_active: 'true'
  )

  Product.create!(
  name: 'マドレーヌ',
  genre_id: '2',
  image_id: '',
  introduction: 'マドレーヌです',
  non_taxed_price: '600',
  is_active: 'true'
  )


  OrderProduct.create!(
    id: 1,
    order_id: 1,
    product_id: 1,
    taxed_price: 0,
    amount: 2,
    making_status: 0
    )

  OrderProduct.create!(
    id: 2,
    order_id: 1,
    product_id: 2,
    taxed_price: 0,
    amount: 5,
    making_status: 3
    )

  CartProduct.create!(
    id: 1,
    customer_id: 1,
    product_id: 1,
    amount: 3
    )

  CartProduct.create!(
    id: 2,
    customer_id: 1,
    product_id: 2,
    amount: 5
    )