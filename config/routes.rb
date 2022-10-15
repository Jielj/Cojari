Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :syndics
  resources :coproperties
  resources :properties
  resources :owners
  resources :expenses
  resources :budgets
  resources :payments
  resources :users
  resources :requests
end
