Rails.application.routes.draw do
  root to: 'users#index'

  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :questions, except: [:show, :new, :index]
end
