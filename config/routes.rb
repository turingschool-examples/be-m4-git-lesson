Rails.application.routes.draw do
  root to:  'landing#index'
  resources :items, only: [:index, :show]
  resource  :cart

  get '/:category', to: 'categories#show', param: :slug, as: "category"
end
