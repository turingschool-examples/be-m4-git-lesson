Rails.application.routes.draw do
  root to:  'landing#index'
  resources :items, only: [:index, :show]
  resource  :cart

  get '/:category', to: 'categories#show', param: :slug, as: "category"
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'session#create'
end
