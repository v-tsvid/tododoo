class OmniauthAuthorizer
  def initialize(auth)
    @auth = auth
  end

  def authorize
    @auth.info ? info = @auth.info : return

    User.by_facebook(@auth).first_or_create do |user|
      user.provider = @auth.provider
      user.uid = @auth.uid
      user.username = info.name
      user.email = info.email || user.email_for_facebook
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = user.password
      user.oauth_token = @auth.credentials.token
      user.oauth_expires_at = Time.at(@auth.credentials.expires_at)
    end
  end
end