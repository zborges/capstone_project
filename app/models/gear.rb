class Gear < ApplicationRecord
  has_many :packs
  has_many :categories
  has_many :categories, through: :category_join
  has_many :users, through: :packs
end
