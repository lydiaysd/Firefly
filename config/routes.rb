Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cameras, only: [:index, :show, :new, :create, :destroy] do
    resources :rentals
  end
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/ro
  get 'dashboard', to: 'users#dashboard', as: :dashboard
end
