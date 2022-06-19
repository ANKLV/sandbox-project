# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, ,:first_name, :last_name, :role)
  end
end
