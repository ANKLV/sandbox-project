# frozen_string_literal: true

class UsersController < ApplicationController

  before_action :set_user, only: %i[show edit update destroy]

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def destroy
    @user.destroy
  end

  def update
    new_user_params = user_params.except(:password) if user_params[:password].blank?
    @user.update(new_user_params || user_params)
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:email, :password, ,:first_name, :last_name, :role)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
