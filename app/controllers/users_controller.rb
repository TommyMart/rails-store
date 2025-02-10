class UsersController < ApplicationController
  # Skip auth before signup and login because user wont have a token yet
  skip_before_action :authenticate_request, only: [ :signup, :login ]

  # POST /signup - New user registration
  def signup
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /login - Returning user login / Auth
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

  # PATCH /update - Update a user data
  def update
    if @current_user.update(params[user_params])
      render json: @current_user, status: :ok
    else
      render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /destroy - Delete a user data
  def destroy
    if @current_user.destroy
      head :no_content
    else
      render json: { error: "Unable to delete accounr" }, status: :unprocessable_entity
    end
  end

  private

  # Strong params to safely handle incoming user data
  def user_params
    params.required(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
