module Api
  module V1
    class OwnersController < ApplicationController
      # Cannot delete an owner for records purposes

      # GET /api/v1/owners/:id
      def show
        owner = Owner.find_by(id: params[:id])
        if owner
          render json: { owner: owner }, status: :ok
        else
          render json: { error: "Owner not found" }, status: :not_found
        end
      end

      # POST /api/v1/owners
      def create
        owner = Owner.new(owner_params)
        if owner.save
          render json: { owner: owner }, status: :created
        else
          render json: { error: "Error creating a new owner", details: owner.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/owners/:id
      def update
        owner = Owner.find_by(id: params[:id])
        if owner
          if owner.update(owner_params)
            render json: { owner: owner }, status: :ok
          else
            render json: { error: "Error updating owner", details: owner.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "Owner not found" }, status: :not_found
        end
      end

      # GET /api/v1/owners/search?query=John
      def search
        query = params[:query]
        if query.present?
          owners = Owner.where(
            "email LIKE ? OR name LIKE ? OR phone LIKE ?",
            "%#{query}%", "%#{query}%", "%#{query}%"
          )
          if owners.any?
            render json: { owners: owners }, status: :ok
          else
            render json: { errors: "No owners found that match your query" }, status: :not_found
          end
        else
          render json: { error: "Missing query parameter" }, status: :bad_request
        end
      end

      private

      def owner_params
        params.require(:owner).permit(:name, :phone, :email, :address)
      end
    end
  end
end
