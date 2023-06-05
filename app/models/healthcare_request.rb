class HealthcareRequest < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  belongs_to :hospital

  has_rich_text :description

  # validates :title, length: { maximum: 60 }, presence: true
  enum status: {
    pending: 0, in_review: 1, rejected: 2, approved: 3
  }.freeze, _default: 'pending'

  validates :status, presence: true, inclusion: { in: statuses }, uniqueness: { case_sensitive: false }
  # validates_presence_of :status
end
