class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  validates :taxed_price, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true
  

  enum making_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3} 
end
