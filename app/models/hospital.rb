class Hospital < ApplicationRecord
  # has_many :users

  enum status: { inactive: 0, active: 1, under_investigation: 2 }.freeze

  validates :name, presence: true, uniqueness: true
  validates_presence_of :status
  validates_uniqueness_of :email, :phone_number, :register_number, allow_blank: true

  # validates :data, presence: true, length: { maximum: 9 }
  # validates :address, presence: true, length: { maximum: 4 }
end
