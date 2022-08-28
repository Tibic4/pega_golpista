# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/reporting'
  get 'pages/types_of_fraud'
  get 'pages/prevention'
  get 'pages/about_us'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
