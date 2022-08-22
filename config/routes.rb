Rails.application.routes.draw do
  resources :lectures do
    collection do
      get 'import/new', to: 'lectures#new_import'
      post :import, to: 'lectures#import'
    end
  end
  resources :tracks
  resources :conferences
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
