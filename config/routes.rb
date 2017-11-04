Rails.application.routes.draw do
  root to:  'landing#index'

  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get    '/dashboard', to: 'users#show'

  resource  :cart
  resources :items,  only: [:index, :show]
  resources :users,  only: [:new, :create]
  resources :orders, only: [:index, :show, :new]

  get '/:category', to: 'categories#show', param: :slug, as: "category"
end
