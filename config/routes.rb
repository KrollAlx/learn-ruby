Rails.application.routes.draw do
  devise_for :users

  resources :tests do
    get 'start', to: 'questions#start', as: :start
  end

  get 'questions/:question_id', to: 'questions#show', as: :question_show
  post 'questions/:question_id/answer', to: 'questions#answer', as: :question_answer

  root 'home#index'
end
