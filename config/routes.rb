Rails.application.routes.draw do

  root to: "main#index"
  
  get 'main/index'

  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks" }
  

end
