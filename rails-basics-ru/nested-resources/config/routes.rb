# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  resources :posts, shallow: true do
    scope module: :posts do
      resources :comments, except: [:index]
    end
  end

  # resources :posts do
  #   resources :comments, only: [:index, :new, :create]
  # end

  # resources :posts, shallow: true do
  #   resources :comments, only: [:show, :edit, :update, :destroy]
  # end

  # resources :books, except: [:index], shallow: true do
  #   resources :pages, only: [:show, :edit, :update, :destroy]
  # end
end
