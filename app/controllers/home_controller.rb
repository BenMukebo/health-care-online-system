class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def logout
    sign_out(current_user)
    redirect_to root_path
  end
end
