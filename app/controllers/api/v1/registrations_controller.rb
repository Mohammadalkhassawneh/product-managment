class Api::V1::RegistrationsController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    user = User.new(sign_up_params)

    if user.save
      render json: { message: 'User registration successful' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation)
  end
  end
  