# frozen_string_literal: true

RailsStats::Engine.routes.draw do
  root to: 'stats#index'
  resources :stats
end
