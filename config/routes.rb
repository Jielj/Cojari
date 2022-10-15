Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :syndics do
    resources :coproperties do
      resources :messages, only: [:create, :index]
    end
    resources :properties, only: :create
  end

  resources :owners do
    resources :coproperties do
      resources :messages, only: [:create, :index]
    end
    resources :properties
  end

  resources :expenses
  resources :budgets
  resources :payments
  resources :users
  resources :requests
end
