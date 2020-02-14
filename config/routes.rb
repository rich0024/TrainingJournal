Rails.application.routes.draw do
  resources :categories
  root 'sessions#home'
  post '/' => 'sessions#create'
  get '/signup' => 'users#new'  
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#github'
  
  resources :lessons do 
    resources :workouts, only: [:new, :create, :index]
  end

  resources :users do
    resources :lessons, only: [:new, :create, :index]
  end

  resources :workouts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
