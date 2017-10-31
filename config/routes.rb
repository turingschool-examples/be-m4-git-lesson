Rails.application.routes.draw do
  resources :items, only: :index
  resource  :cart
  resources :categories, only: :show
end