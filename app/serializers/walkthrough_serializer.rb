class WalkthroughSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :video, :title, :description
end
