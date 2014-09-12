Rails.application.routes.draw do
  root to: 'courses#index'
  devise_for :users
  resources :users

  resources :courses do
    resources :comments
  end
end
