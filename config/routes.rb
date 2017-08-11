Rails.application.routes.draw do

  resources :proposals do
    resources :experiments
    resources :comments
  end

  resources :experiments do
    resources :procedures
    resources :observations
    resources :comments
  end
  resources :users

  get '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/proposals/:id/experiments' => 'experiments#show' # do we need this

  get '/user/:id' => 'user#show'

  root 'proposals#index'
end
