Rails.application.routes.draw do

  root to: "main#index"
  
  get 'main/index'
  
  [:projects, :tasks, :comments].each do |res|
    resources res, except: [:new, :edit]
  end

  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions' }
end
