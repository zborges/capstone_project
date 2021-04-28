class User < ApplicationRecord
  has_many :packs
  has_many :gears, through: :packs
  has_many :categories, through: :category_join
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
