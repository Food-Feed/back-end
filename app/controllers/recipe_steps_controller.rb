class RecipeStepsController < ApplicationController

    def create 
        # byebug
        recipe_step = RecipeStep.create(params[:step_detail])
        render json: recipe_step
    end
end
