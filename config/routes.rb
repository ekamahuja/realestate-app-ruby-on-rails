Rails.application.routes.draw do
  devise_for :accounts
  root "public#main"
end
