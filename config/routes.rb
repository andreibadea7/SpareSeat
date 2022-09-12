Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
    resources :tickets, only: [:new, :create]
  end
  resources :tickets, only: [:edit, :update, :destroy]
  get :my_profile, to: 'users#show'
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
end
