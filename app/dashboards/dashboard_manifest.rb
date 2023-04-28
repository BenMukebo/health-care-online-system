class DashboardManifest
  DASHBOARDS = %w[
    users
    roles
    organizations
    hospitals
    contracts
  ].freeze
  
  ROOT_DASHBOARD = "users".freeze
  # ROOT_DASHBOARD = DASHBOARDS.first
  # ROOT_DASHBOARD_PATH = "/admin/users/sign_in".freeze
end