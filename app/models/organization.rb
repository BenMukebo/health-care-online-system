class Organization < ApplicationRecord
  # has_many :users, dependent: :destroy

  enum status: { inactive: 0, active: 1 }.freeze

  validates :name, presence: true
  validates_presence_of :status
end
