class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_many :recipes
    has_many :ratings
    has_many :comments
end
