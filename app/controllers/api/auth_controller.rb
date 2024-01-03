# frozen_string_literal: true

class Api::SessionsController < ApplicationController
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'hellomars1211')
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(' ')[1]
      begin
        JWT.decode(token, 'hellomars1211')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authorized
    unless !!current_user
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end
end

# def create
#   user = User.find_by(email: params[:email])
#   if user && user.authenticate(params[:password])
#     jwt = JWT.encode(
#       {
#         user_id: user.id, # the data to encode
#         exp: 24.hours.from_now.to_i, # the expiration time
#       },
#       Rails.application.credentials.fetch(:secret_key), # the secret key
#       "HS256" # the encryption algorithm
#     )
#     render json: { jwt: jwt, email: user.email, user_id: user.id }, status: :created
#   else
#     render json: {}, status: :unauthorized
#   end
# end
