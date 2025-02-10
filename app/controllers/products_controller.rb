class ProductsController < ApplicationController
  def index
    products = Product.all

    if products.any?
      render json: products, status: :ok
    else
      render json: "No products found"
    end
  end

  def show
    product = Product.find_by(id: params[:id])

    if product
      render json: product, status: :ok
    else
      render json: { error: "No product found" }, status: :not_found
    end
  end

  def create
    product = Product.new(product_params)

    if product.save
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find_by(id: params[:id])

    if product.nil?
      render json: { error: "Product not found" }, status: :not_found
    elsif product.update(product_params)
      render json: product_params, status: :ok
    else
      render json: product.errors, status: :unprocessable_entity
    end
    render json: product
  end

  def destroy
    product = Product.find_by(id: params[:id])

    if product
      product.destroy
      head :no_content # HTTP 204 No Content
    else
      render json: { error: "Product not found" }, status: :not_found
    end
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
