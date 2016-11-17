Rails.application.routes.draw do

  root to: "main#index"
  
  get 'main/index'
  resources :projects, only: [:index, :show, :update, :destroy]

  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions' }
end
