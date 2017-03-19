Rails.application.routes.draw do

  get 'basket/index'

  root to: "home#index"  #home controller, index action (method)
  devise_for :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :categories do
    resources :products
  end

  resources :products do
    resources :orders
  end

  get 'orders', to: 'orders#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
