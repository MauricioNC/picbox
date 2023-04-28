Rails.application.routes.draw do
  root to: "home#index"

  resources :images
  resources :boxes, only: %i[new update destroy]
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
  get '/:username/boxes', to: 'boxes#show', as: :show_boxes
  get '/:username/likes', to: 'likes#show', as: :show_likes
  get '/:username/downloads', to: 'downloads#show', as: :show_downloads

  post '/boxes', to: 'boxes#create'

  post '/modal_boxes', to: 'boxes#modal_boxes', as: :modal_boxes
end
