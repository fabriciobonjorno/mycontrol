# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :dashboard do
    get 'banks/index'
  end
  namespace :dashboard do
    get 'users/edit'
  end
  namespace :dashboard do
    resources :banks, expect: %i[destroy]
    resources :groups, expect: %i[destroy]
    resources :users, only: %i[edit update]
    resources :accounts, except: %i[destroy show]
    resources :financials, except: %i[destroy index] do
      post :change_paid
      collection do
        get :list_transction
      end
    end
  end
  root 'dashboard#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
