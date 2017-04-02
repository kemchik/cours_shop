Rails.application.routes.draw do

  # get 'basket/index'

  devise_for :users
  root to: "home#index"  #home controller, index action (method)

  resources :categories do
    resources :products
  end

  resources :products do
    resources :orders
  end

  resources :orders
  resources :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
