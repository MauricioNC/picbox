Rails.application.routes.draw do
  root to: "home#index"

  resources :images

  get '/search', to: 'search#search'
  get '/search/images/:tag', to: 'search#search_results', as: :search_results
end
