Rails.application.routes.draw do
  resources :health_warnings
  root 'pages#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  get    '/signup',  to: 'users#new'

  resources :users
  resources :tips, only: [:create, :destroy]
  resources :lessons, only: [:show, :index] do 
    resources :tips, only: [:index, :new]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
