class Role < ApplicationRecord
  has_many :users

  NAME = %i[user client employee manager admin super_admin].freeze
  enum name: NAME.freeze, _default: 'user'

  validates :name, presence: true, uniqueness: true
  # validates :name, inclusion: { in: NAME }
end
