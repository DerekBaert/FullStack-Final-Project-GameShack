Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :games
  resources :orders
  # resources :users
  resources :genres
  resources :platforms

  root to: 'home#index'

  # get    'login'   => 'sessions#new'
  # get    'logout'  => 'sessions#destroy'
  # get    'signup'  => 'users#new'
  # get    'account' => 'users#show'
  get    'home'    => 'home#index'
  get    'search'  => 'search#index'

  post   'games/add_game_to_cart/:id', to: 'games#add_game_to_cart', as: 'add_game_to_cart'
  delete 'games/remove_game_from_cart/:id', to: 'games#remove_game_from_cart', as: 'remove_game_from_cart'

  post   'platforms/add_platform_to_cart/:id', to: 'platforms#add_platform_to_cart', as: 'add_platform_to_cart'
  delete 'platforms/remove_platform_from_cart/:id', to: 'platforms#remove_platform_from_cart', as: 'remove_platform_from_cart'

  # post   'login'   => 'sessions#create' 
  # delete 'logout'  => 'sessions#destroy'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
