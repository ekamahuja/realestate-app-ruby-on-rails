Rails.application.routes.draw do
  resources :properties
  devise_for :accounts
  root "public#main"
end
