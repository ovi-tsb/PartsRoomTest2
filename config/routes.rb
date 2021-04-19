Rails.application.routes.draw do
  resources :products
  root to: 'products#index'


  get 'products/index'
  get 'products/new'
  get 'products/show'
  get 'products/edit'

  resources :products, path: "show"
end
