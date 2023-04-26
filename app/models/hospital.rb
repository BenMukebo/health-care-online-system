class Hospital < ApplicationRecord
  # has_many :users

  enum status: { inactive: 0, active: 1 }.freeze

  validates :name, presence: true
  validates_presence_of :status
  # validates :data, presence: true, length: { maximum: 9 }
  # validates :address, presence: true, length: { maximum: 4 }
end
