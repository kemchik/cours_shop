Rails.application.routes.draw do

  root to: "home#index"  #home controller, index action (method)
  devise_for :users

  resources :categories do
    resources :products
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
