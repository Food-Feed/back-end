class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login]

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back, #{user.username}"}, status: :accepted
        else 
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end

    def auto_login
        if current_user
            render json: current_user
        else
            render json: {errors: "No user logged in."}
        end
    end

    def user_is_authed
        render json: {message: "Login authorized."}
    end
end
