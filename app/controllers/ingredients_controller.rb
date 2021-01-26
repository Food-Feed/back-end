class IngredientsController < ApplicationController

    def create 
        # byebug
        ingredient = Ingredient.create(params[:ingred_detail])
        render json: ingredient
    end

end
