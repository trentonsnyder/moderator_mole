Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'events#index', as: :authenticated_root

    resources :events,    only: [:index, :show, :new, :create]
    resources :purchases, only: [:new] 
  end

  root "home#landing"
end
