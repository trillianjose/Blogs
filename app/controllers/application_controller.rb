class ApplicationController < ActionController::Base
  protect_from_forgery with: :reset_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :age, :email, :password, :password_confirmation) }
  end
end
