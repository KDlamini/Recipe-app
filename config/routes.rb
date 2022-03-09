# frozen_string_literal: true

Rails.application.routes.draw do
  resources :public_recipes
  resources :foods
  devise_for :users
  resources :users
  resources :recipes
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
