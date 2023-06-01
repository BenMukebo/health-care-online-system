class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @user = User.find_by(slug: params[:id])
    # @user = User.find(params[:id])
    @user = current_user
  end

  def update; end

  def destroy
    @user.destroy
  end
end

  private

# Use callbacks to share common setup or constraints between actions.
def set_user
  @user = User.find(params[:id])
end

# Only allow a list of trusted parameters through.
def user_params
  params.require(:user).permit(:password, :first_name, :family_name, :middle_name, :phone,
                               :birth_date, :sex, :image, :identity_number, :bio, :marital_status,
                               :gender, { data: %i[website terms_of_service] },
                               { address: %i[city state country zip_code] },
                               :status)
end
