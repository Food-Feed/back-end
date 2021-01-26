class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :recipe_id, :content, :created_at, :username

  def username
    # user = User.find_by(id: self.object.user_id)
    # user
    User.all.find { |f| f.id == object.user_id }.username
  end

end
