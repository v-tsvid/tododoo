Rails.application.routes.draw do

  root to: "main#index"
  
  get 'main/index'
  resources :projects, only: [:index]

  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions' }
end
