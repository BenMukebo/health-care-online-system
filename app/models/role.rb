class Role < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true

  NAME = { guest: 0, client: 1, employee: 2, manager: 3, admin: 4, superAdmin: 5 }.freeze
  enum name: NAME, _default: 0
end
