Rails.application.routes.draw do
  resources :health_warnings
  root 'pages#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :side_effects
  resources :users
  resources :products, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
