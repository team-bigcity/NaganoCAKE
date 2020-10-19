class Product < ApplicationRecord
  has_many :cart_products
  
  has_many :order_products
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :non_taxed_price, numericality: { only_integer: true }
  validates :is_active, presence: true, inclusion: {in: [true, false]}
  
end