# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search', to: 'searches#index'
  post "searches", to: "searches#create"
  get "autocomplete", to: "searches#autocomplete"
  resources :tasks do
    resources :scammers, only: %i[new create show]
  end
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
