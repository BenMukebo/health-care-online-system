class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :first_name, :familly_name, length: { maximum: 11 }
  validates :phone, uniqueness: true, length: { within: 10..16 }, allow_blank: true
  # validates :matricule_number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_numericality_of :matricule_number, only_integer: true, greater_than_or_equal: 0, allow_blank: true
  # enum marital_status: { single: 0, married: 1, widowed: 2, divorced: 3, separated: 4 }, _default: 'single'

  enum marital_status: { single: 0, married: 1, widowed: 2, divorced: 3, separated: 4 }, _default: 'single'
  validates :marital_status, inclusion: { in: marital_statuses.keys }, allow_blank: true

  enum genders: { Male: 'M', Female: 'F' }
  validates :gender, inclusion: { in: genders.keys }, allow_blank: true

  Status = { inactive: 0, active: 1, break: 3 }.freeze
  enum status: Status

  validate do
    errors.add(:status, "invalid status, please choose one of: #{Status.keys.join(', ')}") if @not_valid_status
  end

  def status=(value)
    if Status.include?(value.to_sym)
      super value
    else
      @not_valid_status = true
    end
  end
end
