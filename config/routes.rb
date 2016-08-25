Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/signin', to: 'sessions#create'

  root to: 'welcome#index'
 

end
