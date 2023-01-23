# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :dashboard do
    resources 'groups', expect: %i[destroy]
    resources :users, only: %i[edit update]
  end
  root 'dashboard#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
