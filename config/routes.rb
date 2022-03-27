Rails.application.routes.draw do
  resources :admins
  resources :food_items
  resources :users
  post 'login', to: 'application#login'
  put 'add_food_item', to: 'users#add_food_item'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
