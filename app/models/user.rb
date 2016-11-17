class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable,          
         :omniauthable, omniauth_providers: [:facebook]

  has_many :projects, dependent: :destroy
end
