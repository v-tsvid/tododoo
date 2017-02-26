Rails.application.routes.draw do
  scope '/api' do
    mount_devise_token_auth_for 'User', at: '/auth'

    root to: "main#index"
    
    get 'main/index'
    
    [:projects, :tasks, :comments].each do |res|
      resources res, except: [:new, :edit]
    end
  end
end
