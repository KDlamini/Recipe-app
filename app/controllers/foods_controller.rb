class FoodsController < ApplicationController
  def index
    @food = Food.all
  end

  def new
    @food = Food.new
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = 'You have successfully deleted this post!'
    redirect_to foods_path
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'Post was sucessfully created'
          redirect_to '/foods'
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
