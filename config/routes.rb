Rails.application.routes.draw do
  resources :items, only: :index
  resource :cart
end
