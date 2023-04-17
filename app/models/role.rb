class Role < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true

  NAME = { Guest: 0, Client: 1, Employee: 2, Manager: 3, Admin: 4, Superadmin: 5 }.freeze
  enum name: NAME

  validate do
    errors.add(:name, "invalid name, please choose one of: #{NAME.keys.join(', ')}") if @not_valid_name
  end

  def name=(value)
    if NAME.include?(value.to_sym)
      super value
    else
      @not_valid_name = true
    end
  end
end
