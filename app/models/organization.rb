class Organization < ApplicationRecord
  # has_many :users, dependent: :destroy

  enum status: { inactive: 0, active: 1, under_investigation: 2 }.freeze

  validates :name, presence: true, uniqueness: true
  validates_presence_of :status
  validates_uniqueness_of :email, :phone_number, :register_number
end
