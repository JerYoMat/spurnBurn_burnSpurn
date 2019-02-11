Rails.application.routes.draw do
  resources :health_warnings
  root 'pages#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  get    '/signup',  to: 'users#new'
  get '/tips/user_tips', to: 'tips#user_tips'

  resources :users
  resources :tips, only: [:show, :create, :destroy]
  resources :lessons, only: [:show, :index] do 
    resources :tips, only: [:index, :new]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
