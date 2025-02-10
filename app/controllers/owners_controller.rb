class OwnersController < ApplicationController
  def show
    owner = Owner.find_by(email: params[email])
    if owner
      render json: { owner: owner }, status: :ok
    else
      render json: { error: "Owner not found" }, status: :not_found
    end
  end

  def search 
    query = params[:query]

    if query.present?
      owners = Owner.where(
        "email LIKE ? OR first_name LIKE ? OR last_name ? OR phone LIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
      )
    end

    if owners.any?
      render json: { owners: owners }, status: :ok
    else
      render json: { errors: "No owners found that match your query" }, status: :not_found 
    end
      else 
        render json: { error: "Missing query params" }, status: :bad_request
      end
  end
end
