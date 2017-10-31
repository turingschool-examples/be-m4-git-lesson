Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resource  :cart
  resources :categories, only: :show
end