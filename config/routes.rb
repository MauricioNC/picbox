Rails.application.routes.draw do
  root to: "home#index"

  resources :images
  resources :boxes, only: %i[new update destroy]
  resources :users, only: %i[new create destroy]

  get '/search', to: 'search#search'
  get '/explore', to: 'images#index'
  post '/like', to: 'likes#like'
  post '/unlike', to: 'likes#unlike'
  post '/image_liked', to: 'likes#image_liked'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  post '/boxes', to: 'boxes#create'

  post '/modal_boxes', to: 'boxes#modal_boxes', as: :modal_boxes
  post '/add_image', to: 'boxes#add_image'
  delete '/remove_image', to: 'boxes#remove_image'
  post '/image_in_box', to: 'boxes#image_in_box'
  get '/boxes/:identifier/:box_name', to: 'boxes#show_images_in_box'

  post '/download', to: 'downloads#download'

  get '/profile_settings', to: 'users#profile_settings', as: :profile_settings
  patch '/profile_settings', to: 'users#update'

  get '/account_settings', to: 'users#account_settings', as: :account_settings
  patch '/account_settings', to: 'users#update'
  delete '/delete_account', to: 'users#delete_account'

  get '/apearance_settings', to: 'users#apearance_settings', as: :apearance_settings
  get '/notifications_settings', to: 'users#notifications_settings', as: :notifications_settings

  get '/:username', to: 'users#profile', as: :profile
  get '/:username/boxes', to: 'boxes#show', as: :show_boxes
  get '/:username/likes', to: 'likes#show', as: :show_likes
  get '/:username/downloads', to: 'downloads#show', as: :show_downloads
end
