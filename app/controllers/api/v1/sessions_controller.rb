class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # User authentication successful
      session[:user_id] = user.id
      render json: { message: 'Login successful' }, status: :ok
    else
      # User authentication failed
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
  private
  def session_params
    params.permit(:email, :password)
  end
end
  