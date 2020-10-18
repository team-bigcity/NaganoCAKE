class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :address, dependent: :destroy
  has_many :cart_products, dependent: :destroy


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :postcode, presence: true, format: {with: /\A\d{7}\z/}
  validates :addresses, presence: true
  validates :phone_number, presence: true, format: {with: / \ A \ d {10,11} \ z /}
  validates :is_deleted, presence: true, inclusion: {in: [true, false]}
end
