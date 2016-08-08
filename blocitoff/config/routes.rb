Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: "home#index"
end
