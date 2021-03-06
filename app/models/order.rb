class Order < ApplicationRecord
  belongs_to :customer

  has_many :order_products, dependent: :destroy

  validates :postcode, presence: true, format: {with: /\A\d{7}\z/}
  validates :address, presence: true
  validates :name, presence: true

  enum payment_method: {クレジットカード:0 ,銀行振込:1}
  enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備:3, 発送済:4}

end
