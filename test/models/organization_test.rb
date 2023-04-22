require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  should validate_presence_of(:name, :status)
  should validate_uniqueness_of(:name)

  should define_enum_for(:status).with_values(inactive: 0, active: 1)
  should validate_inclusion_of(:status).in_array(%w[inactive active])
end
