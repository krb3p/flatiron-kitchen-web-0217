class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  #params => { ingredient_ids => { 1, 2 } }
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.ingredients = Ingredient.where(:id => params[:recipe][:ingredient_ids])
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new_recipe_path
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.ingredients = Ingredient.where(:id => params[:recipe][:ingredient_ids])
    if recipe.update(recipe_params)
      redirect_to recipe_path(recipe)
    else
      render edit_recipe_path(recipe)
    end
  end

private
  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
