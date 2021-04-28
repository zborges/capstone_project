class Category < ApplicationRecord
  has_many :category_joins
  has_many :gears, through: :category_joins
end
