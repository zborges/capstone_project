class Category < ApplicationRecord
  has_many :gears, through: :category_join
  has_many :gears
end
