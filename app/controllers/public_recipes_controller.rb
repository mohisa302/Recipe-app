class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
