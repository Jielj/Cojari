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
  # root "articles#index"
  resources :syndics do
    resources :coproperties do
      resources :messages, only: [:create, :index]
      resources :properties, except: [:index]
    end
  end

  resources :owners, except: [:index] do
    resources :coproperties, only: [:show,:index] do
      resources :messages, only: [:create, :index]
      resources :properties, only: [:show, :index] do
        resources :requests
      end
    end
  end

  resources :expenses
  resources :budgets
  resources :payments
  
  resources :users do
    resources :owners
  end


  post '/expenses/:id/up_vote', to: 'expenses#up_vote', as: 'upvote_expense'
  post '/expenses/:id/down_vote', to: 'expenses#down_vote', as: 'downvote_expense'

 get '/links/:id', to: 'links#show', as: 'link'
end
