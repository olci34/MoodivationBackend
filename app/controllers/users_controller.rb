class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: {error: user.errors.full_messages}
        end
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
