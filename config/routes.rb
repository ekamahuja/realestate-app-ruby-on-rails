Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'
  resources :properties
  devise_for :accounts
  root "public#main"
  get "admin/accounts", to: "admin#accounts", as: :accounts
  get 'profile/:id', to: 'profile#view', as: :profile
  post 'agent/email', to: "properties#email_agent"
  

  resources :conversations do
    resources :messages
  end
  get 'conversations', to: 'conversations#index'
  
end
