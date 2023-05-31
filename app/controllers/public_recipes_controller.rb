class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end


  def show
    @recipe = Recipe.find(params[:id])
  end
end
