# frozen_string_literal: true

class BulletinsController < ApplicationController
  def index
    @buttetins = Bulletin.all.order(created_at: :desc)
  end

  def show
    @buttetin = Bulletin.find(params[:id])
  end
end
