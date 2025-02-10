class UsersController < ApplicationController
  # POST /signup - Registration
  def signup
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Post /login - Login / Auth
  # Auths an existing user and returns a jwt token
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user: user }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  # Strong params to safely handle incoming user data
  def user_params
    params.required(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
