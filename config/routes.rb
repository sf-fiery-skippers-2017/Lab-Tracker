Rails.application.routes.draw do

  resources :proposals do
    resources :experiments
  end

  resources :experiments do
    resources :procedures
  end
  resources :users

  get '/login' => 'sessions#new'

  root 'proposals#index'
end
