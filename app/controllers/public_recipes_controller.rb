class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:recipe_foods,:foods)
    .where(public: true).order('created_at DESC').map do |recipe|
      {
        id: recipe.id,
        name: recipe.name,
        user: recipe.user.name,
        description: recipe.description,
        ingredients_amount: recipe.recipe_foods.count,
        total_price: sums(recipe.recipe_foods)
      }
    end
  end

  def 

  def sums(arr)
    sum = 0
    arr.each do |ar|
      sum += (ar.quantity * ar.food.price)
  end
  return sum
  end
end
