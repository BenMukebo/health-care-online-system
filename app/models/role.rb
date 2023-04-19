class Role < ApplicationRecord
  has_many :users

  NAME = %i[guest client employee manager admin superAdmin].freeze
  enum name: NAME.freeze, _default: 0

  validates :name, presence: true, uniqueness: true
  validates :name, inclusion: { in: names.keys }
end
