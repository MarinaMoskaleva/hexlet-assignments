# frozen_string_literal: true

class Api::V2::UsersController < Api::ApplicationController
  def index
    @users = User.includes(:posts).all
    respond_to do |format| 
      format.json { render json: @users }
    end 
  end

  def show
    @user = User.includes(:posts).find params[:id]
    respond_to do |format| 
      format.json { render json: @user }
    end 
  end
end
