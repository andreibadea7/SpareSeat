Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get :my_profile, to: 'users#show'

  # Events routes
  resources :events, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
    resources :tickets, only: [:new, :create]
  end

  # Tickets routes
  resources :tickets, only: [:edit, :update, :destroy]

  # Orders/Transactions Routes
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  # Stripe webhook routing
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # Chatroom Routes
  resources :chatrooms, only: [:create, :index, :show] do
    resources :messages, only: :create
  end
end
