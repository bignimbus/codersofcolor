Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :dashboard
  get '/about' => 'visitors#about'
  devise_for :users, controllers: { :registrations => 'registrations' }
  resources :users
end
