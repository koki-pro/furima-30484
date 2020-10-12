Rails.application.routes.draw do
  get 'purchases', to: 'purchases#index'
  devise_for :users
  root to: "items#index"
  resources :items
end
