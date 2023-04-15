class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  before_create :generate_matricule_number

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :first_name, :familly_name, length: { maximum: 11 }
  validates :phone, uniqueness: true, length: { within: 10..16 }, allow_blank: true
  validates :matricule_number, uniqueness: true, presence: true, length: { is: 8 }
  # validates :matricule_number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates_numericality_of :matricule_number, only_integer: true, greater_than_or_equal: 0, allow_blank: true
  # validates :data, presence: true, length: { maximum: 9 }
  # validates :address, presence: true, length: { maximum: 4 }

  enum marital_status: { single: 0, married: 1, widowed: 2, divorced: 3, separated: 4 }, _default: 'single'
  validates :marital_status, inclusion: { in: marital_statuses.keys }, allow_blank: true

  enum genders: { Male: 'M', Female: 'F' }
  validates :gender, inclusion: { in: genders.keys }, allow_blank: true

  STATUS = { inactive: 0, active: 1, rest: 3 }.freeze
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

  private

  def generate_matricule_number
    self.matricule_number = SecureRandom.random_number(10**8).to_s.rjust(8, '0')
  end
end
