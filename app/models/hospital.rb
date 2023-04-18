class Hospital < ApplicationRecord
  validates :name, presence: true
  validates_presence_of :name
  validates_uniqueness_of :name
  validates :address, presence: true

  # validates :data, presence: true, length: { maximum: 9 }
  # validates :address, presence: true, length: { maximum: 4 }

  STATUS = { inactive: 0, active: 1 }.freeze
  enum status: STATUS

  validate do
    errors.add(:status, "invalid status, please choose one of: #{STATUS.keys.join(', ')}") if @not_valid_status
  end

  def status=(value)
    if STATUS.include?(value.to_sym)
      super value
    else
      @not_valid_status = true
    end
  end
end
