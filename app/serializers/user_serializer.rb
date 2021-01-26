class UserSerializer < ActiveModel::Serializer
  # has_many :comments
  # has_many :recipes
  attributes :id, :name, :username, :password, :email
end
