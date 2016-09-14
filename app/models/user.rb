class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable,          
         :omniauthable, omniauth_providers: [:facebook]
end
