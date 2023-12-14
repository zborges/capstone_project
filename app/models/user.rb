class User < ApplicationRecord
  has_many :packs
  has_many :items, through: :packs
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
