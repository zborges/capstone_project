class Category < ApplicationRecord
  has_many :gears, through: :category_join
end
