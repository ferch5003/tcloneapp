module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[username password])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email full_name password username])
  end
end
