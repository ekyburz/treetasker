Rails.application.routes.draw do
  resources :tasks
  resources :gardens, only: [:index]
  resources :trees, only: %i[show new create]

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  get '/profile', to: 'pages#profile', as: :profile
  get '/archive', to: 'pages#archive', as: :archive
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # routes for task priorities
  get '/do', to: 'tasks#task_do', as: :tasks_do
  get '/decide', to: 'tasks#task_decide', as: :tasks_decide
  get '/delegate', to: 'tasks#task_delegate', as: :tasks_delegate
  get '/depository', to: 'tasks#task_depository', as: :tasks_depository

  # Defines the root path route ("/")
  # root "posts#index"
end
