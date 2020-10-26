class Product < ApplicationRecord
  extend OrderAsSpecified
  has_many :cart_products

  has_many :order_products

  belongs_to :genre
  attachment :image
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :non_taxed_price, numericality: { only_integer: true }

  def self.search(word)
    Product.where(['name LIKE ?', "%#{word}%"])
  end
end
