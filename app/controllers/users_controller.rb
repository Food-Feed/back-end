class UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]

    # def profile
    #     render json: { user: UserSerializer.new(current_user) }, status: :accepted
    # end

    def create
        user = User.create(user_params)
        # byebug
        if user.valid? 
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token}, status: :created
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.permit(:name, :username, :password, :email)
    end
end
