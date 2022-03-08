class FoodsController < ApplicationController
  def index
    @food = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post was sucessfully created'
          redirect_to "/foods"
        else
          flash.now[:error] = 'post was not created'
          render :new
        end
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
