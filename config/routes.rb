Rails.application.routes.draw do
  resources :use_parts

  get 'use_parts/index'
  get 'use_parts/edit'
  get 'use_parts/update'
  get 'use_parts/show'
  get 'use_parts/new'


  resources :products
  root to: 'products#index'


  get 'products/index'
  get 'products/new'
  get 'products/show'
  get 'products/edit'

  resources :products, path: "show"
end
