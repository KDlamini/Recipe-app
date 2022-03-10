class Ingredient < ApplicationRecord
  self.table_name = 'recipe_foods'
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
