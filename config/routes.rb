Rails.application.routes.draw do

  # get 'questions/index'
  # get 'questions/new'
  # get 'questions/show'
  # get 'sessions/new'
  # get 'users/new'
  # get 'users/index'

  get '/questions/unsolved', to: 'questions#unsolved'
  get '/questions/solved', to: 'questions#solved'
  resources :users, only: [:new ,:index, :create]

  root "questions#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :questions do
    resources :comments, only: :create
  end






  namespace :admin do
    resources :questions, only: [:index,:destroy]
    resources :users, only: [:index, :destroy]
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
end
 