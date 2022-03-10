class GeneralShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @general_shopping_list = @recipe.recipe_foods.includes(:foods)
  end
end
