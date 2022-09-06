Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events, only: [:index, :show] do
    resources :tickets, only: [:new, :create]
  end
end
