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

  root 'proposals#index'
end
