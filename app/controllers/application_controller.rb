class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :null_session,
                       if: Proc.new { |c| c.request.format =~ %r{application/json} }

  # user access
  before_action :authenticate_user!

  # index action
  def index; end

  # @Ref: https://github.com/michaelbanfield/devise-pwned_password
  # Ref description: guide on how to use devise devise-pwned_password gem
  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # SECURE - use devise-pwned_password gem to warn existing users about vulnerable password when they sign in
  def after_sign_in_path_for(resource)
    set_flash_message! :alert, :warn_pwned if resource.respond_to?(:pwned?) && resource.pwned?
    super
  end

  # display toast alert if user attempts unauthorised action
  rescue_from CanCan::AccessDenied do |exception|
    redirect_back fallback_location: root_path, alert: "Sorry, you do not have access to perform this action."
  end

end
