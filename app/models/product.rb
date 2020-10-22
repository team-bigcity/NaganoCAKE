class Product < ApplicationRecord
  has_many :cart_products
  
  has_many :order_products
  
  belongs_to :genre
  
  attachment :image
  validates :name, presence: true
  validates :introduction, presence: true
  validates :non_taxed_price, numericality: { only_integer: true }
end
