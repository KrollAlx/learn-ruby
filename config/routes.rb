Rails.application.routes.draw do
  devise_for :users
  resources :tests
  root 'home#index'
end
