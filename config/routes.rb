Rails.application.routes.draw do
  resources :games
  resources :orders
  resources :users
  resources :genres
  resources :platforms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
