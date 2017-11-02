Rails.application.routes.draw do
  root to:  'landing#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :items, only: [:index, :show]
  resource  :cart
  resources :users, only: [:show]
  get '/:category', to: 'categories#show', param: :slug, as: "category"
end
