class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  # before_filter :authenticate_user!

  # index action
  def index; end

  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # SECURE - use devise-pwned_password gem to warn existing users about vulnerable password when they sign in
  def after_sign_in_path_for(resource)
    set_flash_message! :alert, :warn_pwned if resource.respond_to?(:pwned?) && resource.pwned?
    super
  end

end
