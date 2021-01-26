class RatingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :recipe_id, :value
end
