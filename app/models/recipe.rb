class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients

  validates :name, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 1000 }

  def add_ingredient!(food, quantity)
    already_exists = foods.find_by(name: food.name)
    if already_exists
      ingredients.create!(food: already_exists, quantity:) unless already_exists
    else
      ingredients.create!(food:, quantity:) unless already_exists
    end
  end
end
