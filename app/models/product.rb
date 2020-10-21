class Product < ApplicationRecord
  has_many :cart_products
  
  has_many :order_products
  
  attachment :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :non_taxed_price, numericality: { only_integer: true }
  validates :is_active, inclusion: {in: [true, false]}
  
end
