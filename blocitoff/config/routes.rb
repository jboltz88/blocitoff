Rails.application.routes.draw do
  
  devise_for :users

  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  authenticated do
    root to: 'users#show', as: :authenticated_root
  end

  root to: 'home#index'

  #root to: "users#show"
end
