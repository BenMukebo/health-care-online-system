class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def home
    # TODO: Implement logic for home page
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name family_name agreed_to_terms])
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    # flash[:alert] = t("flash.pundit.unauthorized")
    redirect_back(fallback_location: root_path)
  end
end
