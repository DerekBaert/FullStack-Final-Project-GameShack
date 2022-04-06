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

  # post   'login'   => 'sessions#create' 
  # delete 'logout'  => 'sessions#destroy'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
