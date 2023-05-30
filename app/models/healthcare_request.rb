class HealthcareRequest < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  belongs_to :hospital

  has_rich_text :description

  validates :tile, length: { maximum: 60 }, presence: true
  enum status: { pending: 0, rejected: 1, approved: 2 }.freeze

  validates_presence_of :status
end
