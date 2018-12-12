Rails.application.routes.draw do
  resources :listings
  resources :appointments
  resources :buyers
  resources :users
  get '/login' => 'sessions#new'
  post '/session' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
