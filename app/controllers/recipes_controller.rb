class RecipesController < ApplicationController

    def index
        recipes = Recipe.all
        # byebug
        render json: recipes
    end

    def create 
        # byebug
        image = Cloudinary::Uploader.upload(params[:image], :folder => "Food Feed")
        video = Cloudinary::Uploader.upload(params[:video], :resource_type => :video, :folder => "Food Feed")
        recipe = Recipe.create(user_id: current_user.id, image: image["url"], video: video["url"], title: params[:title], favorited: false)


        # byebug
        ingredients = JSON.parse(params[:ingredients])
        ingredients.map do |ingredient|
            # byebug
            Ingredient.create(recipe_id: recipe.id, ingred_detail: ingredient["ingred_detail"])
        end
        recipe_steps = JSON.parse(params[:recipe_steps])
        recipe_steps.map do |recipe_step|
            RecipeStep.create(recipe_id: recipe.id, step_detail: recipe_step["step_detail"])
        end
        # byebug
        render json: recipe
    end


    def show
        recipe = Recipe.find(params[:id])
        render json: recipe
    end

    def update
        recipe = Recipe.find(params[:id])
        recipe.update(title: params[:title])

        ingredients = JSON.parse(params[:ingredients])
        ingredients.map do |ingredient|
            found_ingredient = Ingredient.find_by(id: ingredient["id"])
            # byebug
            found_ingredient.update(ingred_detail: ingredient["ingred_detail"])
        end
        # ingredients.sort_by{ |ingredient| ingredient["id"] }
        recipe_steps = JSON.parse(params[:recipe_steps])
        recipe_steps.map do |recipe_step|
            found_recipe_step = RecipeStep.find_by(id: recipe_step["id"])
            found_recipe_step.update(step_detail: recipe_step["step_detail"])
        end
        # byebug
        recipe_steps.sort_by{ |recipe_step| recipe_step["id"] }

        render json: recipe
    end

    def destroy 
        recipe = Recipe.find(params[:id])
        image = recipe.image
        video = recipe.video

        imageEnd = image.rpartition('/').last
        image_public_id = imageEnd.rpartition(".").first

        videoEnd = video.rpartition('/').last
        video_public_id = videoEnd.rpartition(".").first

        Cloudinary::Uploader.destroy(image_public_id, :folder => "Food Feed")
        Cloudinary::Uploader.destroy(video_public_id, :resource_type => :video, :folder => "Food Feed")
        recipe.destroy

        render json: recipe
    end

    private

    def recipe_params
        params.permit(:id, :image, :video, :title, :favorited, :ingredients, :recipe_steps)
    end

end