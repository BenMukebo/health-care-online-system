class RegistrationsController < Devise::RegistrationsController
  def new
    super do |resource|
      resource.build_role # assuming you have a role model associated with User
    end
  end

  def create
    super
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id, :first_name, :family_name)
  end
end
