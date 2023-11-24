Rails.application.routes.draw do
  passwordless_for :users

  resources :posts

  root "pages#index"
end
