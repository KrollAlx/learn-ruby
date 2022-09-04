Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registration: 'users/registration',
    passwords: 'users/passwords'
  }

  get 'progress/show'
  post 'progress/:test_id/details', to: 'progress#details', as: :progress_details
  post 'progress/:test_id/hide', to: 'progress#hide', as: :progress_hide

  resources :tests do
    get 'start', to: 'tests#start', as: :start
    get 'result', to: 'tests#result', as: :result
  end

  get 'questions/:question_id', to: 'questions#show', as: :question_show
  post 'questions/:question_id/answer', to: 'questions#answer', as: :question_answer

  root 'home#index'
end
