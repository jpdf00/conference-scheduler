# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'conferences#index'
  resources :lectures, except: [:new, :index] do
    collection do
      get 'import/new', to: 'lectures#new_import'
      post :import, to: 'lectures#import'
    end
  end
  resources :tracks, only: [:create, :destroy, :show]
  resources :conferences
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
