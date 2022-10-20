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
  end

  resources :owners do
    resources :coproperties do
      resources :messages, only: [:create, :index]
    end
  end


  # resources :coproperties, only: :destroy
  # resources :properties, only: :destroy
  # resources :owners
  # ressources :properties, only: :show
  resources :properties
  resources :expenses
  resources :budgets
  resources :payments
  resources :users
end
