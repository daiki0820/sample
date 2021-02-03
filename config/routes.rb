Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :words do
    member do
      get "show2"
    end
    resources :meanings, only: [:create, :destroy, :update, :edit] do
      resources :likes, only: [:create, :destroy]
    end
  end
  
  root "words#index"
end
