Rails.application.routes.draw do
  root 'sessions#home'
  post '/' => 'sessions#create'
  get '/signup' => 'users#new'  
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :workouts
  resources :lessons
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
