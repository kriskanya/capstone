Rails.application.routes.draw do
  root to: 'courses#index'
  devise_for :users
  resources :users

  resources :courses do
    resources :comments do
      member do
        put "like", to: "comments#upvote"
        put "dislike", to: "comments#downvote"
      end
    end
  end

  resources :courses do
    member do
      put "like", to: "courses#upvote"
      put "dislike", to: "courses#downvote"
    end
  end

  # resources :comments do
  #   member do
  #     put "like", to: "comments#upvote"
  #     put "dislike", to: "comments#downvote"
  #   end
  # end
end
