class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  #/ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render new_ingredient_path
    end
    #do valid? thing first
    #.add an error message
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render edit_ingredient_path(@ingredient)
    end
  end

private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
