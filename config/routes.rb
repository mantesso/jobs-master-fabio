# frozen_string_literal: true
Rails.application.routes.draw do
  resources :weapons
  resources :characters
  resources :fights, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'
end