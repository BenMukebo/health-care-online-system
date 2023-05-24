class DashboardController < ApplicationController
  # include Pundit::Authorization
  before_action :authenticate_user!
  before_action :require_admin

  def index
    # puts "DashboardController-index"
    # @organizations = current_user.organizations
    # @top_categories = Category.joins(:organizations).group(:id).order("COUNT(organizations.id) DESC").limit(3)
    # @top_locations = Location.joins(:organizations).group(:id).order("COUNT(organizations.id) DESC").limit(3)
    # @unpublished_organizations = current_user.organizations.where(status: :pending)
  end

  private

  def require_admin
    # binding.pry
    return if current_user&.admin? || current_user&.super_admin?

    flash[:alert] = 'You must be an admin to access this page.'
    redirect_to home_path
  end
end
