Rails.application.routes.draw do
  devise_for :users
  get 'items', to: 'items#index'
end
