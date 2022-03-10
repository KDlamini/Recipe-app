class IngredientsController < ApplicationController
  # GET /ingredients/new
  def new
    @foods = current_user.foods.all
    @recipe = current_recipe
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
    set_edit
  end

  # POST /ingredients
  def create
    food = Food.find(params[:food_id])
    @ingredient = current_recipe.add_ingredient(food, ingredient_params[:quantity])

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to recipe_path(current_recipe), notice: 'Food ingredient was successfully added.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    set_edit

    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  def destroy
    current_ingredient.destroy!

    respond_to do |format|
      format.html { redirect_to recipe_path(current_recipe), notice: 'Ingredient was successfully removed.' }
    end
  end

  private

  def set_edit
    @ingredient = current_ingredient
    @recipe = Recipe.find(current_ingredient.recipe_id)
  end

  def current_recipe
    Recipe.find(params[:recipe_id])
  end

  def current_ingredient
    Ingredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:quantity)
  end
end
