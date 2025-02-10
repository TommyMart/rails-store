class ApplicationController < ActionController::API
  # Run authentication for every request by default
  before_action :authenticate_request

  private

  def authenticate_request
    # Header should include "Bearer <token>"
    header = request.headers["Authorization"]
    # Last is the token when split " "
    token = header.split(" ").last if header

    # Decode the token using our JWT helper
    decoded = JsonWebToken.decode(token)

    # If decoding is successful, set @current_user
    @current_user = User.find_by(id: decoded[:user_id]) if decoded

    # If no current user, render error message
    render json: { error: "Not Authorised" }, status: :unauthorized unless @current_user
  end
end
