require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should belongs_to(:roles)
end
