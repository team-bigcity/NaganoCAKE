class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  
  validates :amount, numericality: { only_integer: true }
end
