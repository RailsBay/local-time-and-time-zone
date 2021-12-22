class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if:  :devise_controller?
  around_action :set_time_zone, if: :current_user

  private
  def set_time_zone
    Time.use_zone(current_user.time_zone) { yield }
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :time_zone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :time_zone])
  end
end
