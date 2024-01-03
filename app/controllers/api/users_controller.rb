# frozen_string_literal: true

class Api::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
    user = User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    @token = encode_token(user_id: user.id)

    if user.save
      @pack = Pack.new(
        user_id: user.id
      )
      @pack.save
      render json: {
        user: UserSerializer.new(user),
        token: @token
      }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def handle_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def show
    @user = User.find(params[:id])
    # byebug
    if @user.pack.items.empty?
      render json: 'User does not have any gear'
    else
      render 'show.json.jb'
    end
  end

  def destroy
    input = params[:id]
    user = User.find(input)
    if user.delete
      render json: { message: 'user deleted successfully' }
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
