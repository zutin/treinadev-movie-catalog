Rails.application.routes.draw do
  root to: 'catalog#index'

  resources :genres, only: [:index, :show, :new, :create, :edit, :update]
  resources :directors, only: [:index, :show, :new, :create, :edit, :update]
  resources :movies, only: [:show, :new, :create, :edit, :update]
end
