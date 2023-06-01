class Role < ApplicationRecord
  has_many :users

  NAME = %i[user doctor admin super_admin employee client].freeze
  enum name: NAME.freeze # _default: 'user'

  validates :name, presence: true, inclusion: { in: names }, uniqueness: { case_sensitive: false }
end
