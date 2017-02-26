class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :omniauthable, omniauth_providers: [:facebook]
  include DeviseTokenAuth::Concerns::User

  has_many :projects, dependent: :destroy

  scope :by_facebook, -> (auth) { where(provider: auth.provider, uid: auth.uid) }
end
