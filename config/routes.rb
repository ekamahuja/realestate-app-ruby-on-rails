Rails.application.routes.draw do
  get 'dashboard/index'
  resources :properties
  devise_for :accounts
  root "public#main"
end
