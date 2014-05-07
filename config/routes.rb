CardStore::Application.routes.draw do

  resources :orders

  resources :product_models

  resources :categories
  # resources :product_users

  resources :products do
    resources :product_users
  end

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  resources :cart_items, only: [:index, :create, :destroy], path: 'comprar' do
    post :update_all, on: :collection
  end
end
