class GeneralShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @total_amount = sums(@recipe.ingredients)
  end

  def sums(arr)
    sum = 0
    arr.each do |ar|
      sum += (ar.quantity * ar.food.price)
    end
    sum
  end
end
