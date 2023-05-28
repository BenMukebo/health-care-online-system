class HealthcareRequest < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  belongs_to :hospital

  has_rich_text :description
end
