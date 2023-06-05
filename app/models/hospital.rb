class Hospital < ApplicationRecord
  include Validatable
  has_many :users
  has_many :contracts, dependent: :destroy
  has_many :organizations, through: :contracts # , dependent: :destroy
  has_many :healthcare_requests

  has_one_attached :logo
  has_rich_text :description

  enum status: { inactive: 0, active: 1, under_investigation: 2 }.freeze
end
