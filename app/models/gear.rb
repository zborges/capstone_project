class Gear < ApplicationRecord
  has_many :packs
  has_many :category_joins
  has_many :categories, through: :category_joins
  has_many :users, through: :packs
end
