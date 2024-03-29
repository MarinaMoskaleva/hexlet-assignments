# frozen_string_literal: true

class Api::V1::UsersController < Api::ApplicationController
  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.includes(:posts).find params[:id]
  end
end
