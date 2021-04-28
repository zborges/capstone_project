class CategoryJoin < ApplicationRecord
  belongs_to :gear
  belongs_to :user
end
