class Hospital < ApplicationRecord
  belongs_to :user
  has_many :treatments
  has_many :healthcare_requests

  validates :name, presence: true
  validates :address, presence: true
  validates :treatments_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :healthcare_requests_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
