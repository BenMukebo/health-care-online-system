class Hospital < ApplicationRecord
  # has_many :users

  STATUS = %i[inactive active].freeze
  enum status: STATUS.freeze, _default: 0

  validates :name, presence: true
  validates_presence_of :status
  # validates :data, presence: true, length: { maximum: 9 }
  # validates :address, presence: true, length: { maximum: 4 }
end
