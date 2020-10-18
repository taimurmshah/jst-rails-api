Rails.application.routes.draw do
  resources :employees
  resources :jobs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :show, :index, :update, :destroy, :name] do
    resources :jobs, only: [:index, :show, :create, :update, :destroy]
  end

  get "users/:id/name", to: "users#name"




end
