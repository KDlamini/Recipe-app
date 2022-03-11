class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:ingredients,
                                      :foods).where(public: true).order('created_at DESC').map do |recipe|
      {
        id: recipe.id,
        name: recipe.name,
        user: recipe.user.name,
        description: recipe.description,
        ingredients_amount: recipe.ingredients.count,
        total_price: sums(recipe.ingredients)
      }
    end
  end

  def sums(arr)
    sum = 0
    arr.each do |ar|
      sum += (ar.quantity * ar.food.price)
    end
    sum
  end
end
