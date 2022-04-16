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
  get   'home'    => 'home#index'
  get   'search'  => 'search#index'
  get   'cart', to: 'home#cart', as: 'cart'

  post   'games/add_game_to_cart/:id', to: 'games#add_game_to_cart', as: 'add_game_to_cart'
  post   'games/update_game_quantity/:id', to: 'games#update_game_quantity', as: 'update_game_quantity'
  delete 'games/remove_game_from_cart/:id', to: 'games#remove_game_from_cart', as: 'remove_game_from_cart'

  post   'platforms/add_platform_to_cart/:id', to: 'platforms#add_platform_to_cart', as: 'add_platform_to_cart'
  post   'platforms/update_platform_quantity/:id', to: 'platforms#update_platform_quantity', as: 'update_platform_quantity'
  delete 'platforms/remove_platform_from_cart/:id', to: 'platforms#remove_platform_from_cart', as: 'remove_platform_from_cart'

  # post 'home/update_quantity/:id', to: 'home#update_quantity', as: 'update_quantity_path'

  # post   'login'   => 'sessions#create' 
  # delete 'logout'  => 'sessions#destroy'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
