Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resource  :cart
  # resources :categories, only: :show

  get '/:category', to: 'categories#show', param: :slug, as: "category"
end
