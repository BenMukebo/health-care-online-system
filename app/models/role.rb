class Role < ApplicationRecord
  has_many :users

  # NAME = %i[user doctor admin super_admin employee client].freeze
  # enum name: NAME.freeze
  enum name: {
    user: 0,
    doctor: 1,
    admin: 2,
    super_admin: 3,
    employee: 4,
    client: 5
  }.freeze, _prefix: true

  validates :name, presence: true, inclusion: { in: names }, uniqueness: { case_sensitive: false }
end
