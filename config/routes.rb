Rails.application.routes.draw do
  root to: 'courses#index'
  devise_for :users
  resources :users

  resources :courses do
    resources :comments
  end

  resources :courses do
    member do
      put "like", to: "courses#upvote"
      put "dislike", to: "courses#downvote"
    end
  end
end
