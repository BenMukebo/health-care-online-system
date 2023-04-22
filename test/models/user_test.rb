require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should belongs_to(:roles)

  should validate_presence_of(
    :email, :phone, :matricule_number, :first_name, :last_name, :agreed_to_terms, :role_id
  )
  should validate_uniqueness_of(:email, :phone, :matricule_number)

  should define_enum_for(:status).with_values(inactive: 0, active: 1, rest: 2)
  should validate_inclusion_of(:status).in_array(%w[inactive active rest])
end
