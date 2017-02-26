class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token
  # after_action  :set_csrf_cookie_for_ng

  wrap_parameters format: []
  respond_to :json

  protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    end

    # def set_csrf_cookie_for_ng
    #   cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    # end
end
