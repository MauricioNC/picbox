Rails.application.routes.draw do
  root to: "home#index"

  resources :images
  resources :users, only: %i[new create update destroy]

  get '/search', to: 'search#search'
  post '/like', to: 'likes#like'
  post '/unlike', to: 'likes#unlike'
  post '/image_liked', to: 'likes#image_liked'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  get '/:username', to: 'users#profile', as: :profile
  get '/:username/boxes', to: 'users#boxes', as: :boxes
  get '/:username/likes', to: 'users#likes', as: :likes
  get '/:username/downloads', to: 'users#downloads', as: :downloads
end
