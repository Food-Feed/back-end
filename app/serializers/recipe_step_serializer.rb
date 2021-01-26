class RecipeStepSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :step_detail
end
