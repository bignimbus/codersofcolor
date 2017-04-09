Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :dashboard
  resources :visitors, only: [:new, :create, :about, :index]
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users
end
