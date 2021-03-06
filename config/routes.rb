CardStore::Application.routes.draw do

  resources :contacts

  resources :banners

  mount Ckeditor::Engine => '/ckeditor'
  resources :pages

  resources :orders do #, only: [:index, :new, :show, :create] do
    member do
      get :thanks
      put :to_dispatch
      put :dispatched
      post :send_invoice
    end
  end

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
