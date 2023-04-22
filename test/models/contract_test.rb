require 'test_helper'

class ContractTest < ActiveSupport::TestCase
  should belong_to(:organization)
  should belong_to(:hospital)

  should validate_presence_of(:start_date, :end_date, :agreement_type, :status)

  should define_enum_for(:status).with_values(service: 0, purchase: 1, lease: 2, licensing: 3, non_disclosure: 4, memorandum: 5)
  should validate_inclusion_of(:status).in_array(%w[service purchase lease licensing non_disclosure memorandum])
end
