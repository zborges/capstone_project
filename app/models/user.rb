class User < ApplicationRecord
  has_one :pack
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
