Rails.application.routes.draw do



  get 'admin/home'
  devise_for :admins
  get 'admin_products/index'

  # get 'basket/index'

  devise_for :users
  root to: "home#index"  #home controller, index action (method)

  resources :categories do
    resources :products
  end

  resources :products do
    resources :comments
  end

  resources :products do
    resources :orders
  end

  resources :orders
  resources :customers

  resources :customers do
    resources :orders
  end

  resources :admin

  resources :admin_products

  resources :office

  resources :download
  # get 'admin_products/update'

  resources :products do
    collection { post :import }
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
