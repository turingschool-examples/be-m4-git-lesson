Rails.application.routes.draw do
  root to:  'landing#index'

  namespace :admin do
    resource  :dashboard, only: :show, controller: :dashboard
    resources :users,     only: [:show, :edit, :update]

    get '/ordered',   to: 'orders#index'
    get '/paid',      to: 'orders#index'
    get '/cancelled', to: 'orders#index'
    get '/completed', to: 'orders#index'
  end

  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get    '/dashboard', to: 'users#show'

  resource  :cart
  resources :items,  only: [:index, :show]
  resources :users,  only: [:new, :create]
  resources :orders, only: [:index, :show, :create, :update]


  get '/categories', to: 'categories#index'
  get '/:category',  to: 'categories#show', param: :slug, as: "category"
end