class Gear < ApplicationRecord
  has_many :packs
  has_many :categories
  has_many :users, through: :packs
end
