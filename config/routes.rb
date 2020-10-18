Rails.application.routes.draw do
  resources :employees
  resources :jobs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :show, :index, :update, :destroy, :name]
  post "login", to: "auth#create"

  resources :jobs, only: [:index, :show, :create, :update, :destroy]

  get "users/:id/name", to: "users#name"
  get "users/:user_id/jobs/:id/check-it-out", to: "jobs#check"
end
