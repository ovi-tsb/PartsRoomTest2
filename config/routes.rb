Rails.application.routes.draw do
  
  

  namespace :admin do
      resources :users
      resources :admin_users
      resources :super_users
      resources :plants
      resources :products
      resources :use_parts

      root to: "users#index"
    end
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

    member do
      get :add
      post :add_product
    end
    collection do
      post :print_labels
    end
  end


  # authenticated do
  #   root :to => 'products#index'
  # end

  get 'home/index'
  devise_for :users

  root to: 'home#index'
   

    

  # resources :products, path: "show"


end
