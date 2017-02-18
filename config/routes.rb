Rails.application.routes.draw do

  root to: "main#index"
  
  get 'main/index'
  resources :projects, except: [:new, :edit]
  resources :tasks, only: [:create, :index, :destroy, :update]

  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions' }
end
