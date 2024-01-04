# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user
  end

  def create?
    user
  end

  def new?
    create?
  end

  def update?
    user && (record.author_id == user.id || user.admin)
  end

  def edit?
    update?
  end

  def destroy?
    user && user.admin
  end
end
