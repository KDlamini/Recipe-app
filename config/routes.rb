# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users
  resources :foods
  resources :public_recipes
  # resources :general_shopping_lists
  get "/recipes/:recipe_id/general_shopping_lists", to: "general_shopping_lists#index", as: 'general_shopping_lists'
  resources :recipes do
    resources :ingredients, controller: 'ingredients', except: [ :index, :show ], shallow: true
    resources :general_shopping_lists, only: [:index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
