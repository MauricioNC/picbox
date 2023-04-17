Rails.application.routes.draw do
  root to: "home#index"

  resources :images

  get '/search', to: 'search#search'
end
