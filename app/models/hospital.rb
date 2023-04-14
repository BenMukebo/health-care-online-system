class Hospital < ApplicationRecord
  enum status: { active: 0, inactive: 1 }
  validates :name, presence: true
  validates :address, presence: true
end
