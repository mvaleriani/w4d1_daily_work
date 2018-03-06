require 'byebug'

class UsersController < ApplicationController
  def index
    all_users = User.all
    render json: all_users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end

  end

  def destroy
    to_delete = User.find(params[:id])
    to_delete.destroy
    index
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:username)
  end

end
