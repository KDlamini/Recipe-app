class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients

  validates :name, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 1000 }

  def add_ingredient(food, quantity)
    already_exists = foods.find_by(name: food.name)
    ingredients.create(food: food, quantity: quantity) unless already_exists
  end
end
