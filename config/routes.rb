CardStore::Application.routes.draw do
  resources :categories

  resources :products

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end