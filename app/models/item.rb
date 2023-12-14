class Item < ApplicationRecord
      # Gear has: name, description, weight, quantity, category. Can remove "item"
    # Need to say gear has one category
    # Gears belong to a pack
  has_one :packs
  has_one :category
  has_one :user, through: :packs
end
