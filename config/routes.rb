# frozen_string_literal: true

Rails.application.routes.draw do
  # Devise routes only sessions
  devise_for :admins, only: %i[sessions]

  resources :tasks do
    resources :scammers, only: %i[new create show]
  end
  root 'pages#home'
end
