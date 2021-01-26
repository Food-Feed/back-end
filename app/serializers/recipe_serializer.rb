class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :image, :video, :title, :author, :ingredients, :recipe_steps, :favorited, :ratings, :comments

  def author
    self.object.user.name
  end
end
