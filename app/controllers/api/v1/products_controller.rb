class Api::V1::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    products = Product.all
    render json: products
  end

  def create
    product = Product.create(product_params)

    if product.save
      render json: { message: 'Product created successfully', product: product }, status: :created
    else
      render json: { error: 'Failed to create product', errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product
    else
      render json: { error: 'Failed to update product' }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      render json: { message: 'Product successfully deleted' }
    else
      render json: { error: 'Failed to delete product' }, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.permit(:product_id, :product_name, :sender_fee, :sender_fee_percentage, :discount_percentage, :logo_urls, :denomination_type, :recipient_currency_code, :min_recipient_denomination, :max_recipient_denomination, :sender_currency_code, :min_sender_denomination, :max_sender_denomination, :fixed_recipient_denominations, :fixed_sender_denominations, :fixed_recipient_to_sender_denominations_map, :brand, :country, :redeem_instruction)
  end
end
