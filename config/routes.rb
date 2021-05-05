Rails.application.routes.draw do
  devise_for :users
  resources :use_parts

  get 'use_parts/index'
  get 'use_parts/edit'
  get 'use_parts/update'
  get 'use_parts/show'
  get 'use_parts/new'



  resources :products do
    member do
      get :use
      post :do_use
    end
  end
  
  root to: 'products#index'



  resources :products, path: "show"


end
