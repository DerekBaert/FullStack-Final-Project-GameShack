Rails.application.routes.draw do
  resources :orders
  resources :users
  resources :genres
  resources :platforms
  resources :controllers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
