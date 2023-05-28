class Role < ApplicationRecord
  has_many :users

  NAME = %i[super_admin admin user employee manager client].freeze
  enum name: NAME.freeze, _default: 'user'

  validates :name, presence: true, uniqueness: true
  # validates :name, inclusion: { in: NAME }
end
