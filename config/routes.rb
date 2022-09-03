# frozen_string_literal: true

Rails.application.routes.draw do
  resources :search, only: [] do
    collection do
      get :index
    end
  end
  resources :tasks do
    resources :scammers, only: %i[new create show]
  end
  get "zones", to: "zones#index"
  root 'pages#home'
  get 'pages/reporting'
  get 'pages/types_of_fraud'
  get 'pages/prevention'
  get 'pages/about_us'
  get 'pages/map'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
