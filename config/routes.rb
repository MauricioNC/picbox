Rails.application.routes.draw do
  root to: "home#index"

  resources :images

  get '/search', to: 'search#search'
  post '/like', to: 'likes#like'
  post '/unlike', to: 'likes#unlike'
  post '/image_liked', to: 'likes#image_liked'
end
