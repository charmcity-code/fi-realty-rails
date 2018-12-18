Rails.application.routes.draw do
  resources :listings
  resources :users

  resources :buyers do
    resources :appointments, only: [:index, :new]
  end

  resources :appointments
  get '/login' => 'sessions#new'
  post '/session' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
