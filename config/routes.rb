Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :games
  resources :orders
  resources :users
  resources :genres
  resources :platforms
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'signup'  => 'users#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
