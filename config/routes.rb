Rails.application.routes.draw do
  get 'link/show'
    #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticate :user, ->(user) { user.admin? } do
    #mount Blazer::Engine, at: "blazer"
  end

  # Defines the root path route ("/")

  resources :syndics do
    resources :coproperties do
      resources :owners
      resources :budgets
      resources :expenses
      resources :payments, except: [:create]
      resources :messages, only: [:create, :index, :delete]
      resources :properties
      resources :requests, except: [:create, :delete]
    end
  end

  resources :owners do
    resources :coproperties, only: [:show] do
      resources :budgets, only: [:show, :index]
      resources :expenses, only: [:show, :index]
      resources :payments, only: [:new, :create, :show, :index]
      resources :messages, only: [:create, :index]
      resources :properties, only: [:show, :index]
      resources :requests, only: [:new, :create, :show, :index]
    end
  end

  resources :users do
    resources :owners
  end

  get '/syndics/:syndic_id/coproperties/:coproperty_id/dashboard', to: 'pages#syndic_dashboard', as: 'syndic_dashboard'
  get '/owners/:owner_id/coproperties/:coproperty_id/dashboard', to: 'pages#owner_dashboard', as: 'owner_dashboard'


  post '/expenses/:id/up_vote', to: 'expenses#up_vote', as: 'upvote_expense'
  post '/expenses/:id/down_vote', to: 'expenses#down_vote', as: 'downvote_expense'

 get '/links/:id', to: 'links#show', as: 'link'
end
