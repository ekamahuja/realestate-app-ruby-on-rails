Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'
  resources :properties
  devise_for :accounts
  root "public#main"
  get 'profile/:id', to: 'profile#view', as: :profile
  

  resources :conversations do
    resources :messages
  end
  get 'conversations', to: 'conversations#index'
  
end
