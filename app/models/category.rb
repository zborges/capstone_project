class Category < ApplicationRecord
  has_many :category_joins
  has_many :items
end
