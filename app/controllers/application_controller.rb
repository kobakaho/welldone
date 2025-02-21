class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resources)
    cloths_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ :profile_image ])
  end
end
