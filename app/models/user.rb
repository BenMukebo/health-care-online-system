class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  after_initialize :set_default_role

  before_create :generate_matricule_number, unless: -> { matricule_number.present? }
  # before_validation :generate_matricule_number, on: :create
  # enum :marital_status, %i[single married midowed divorced separated].freeze
  enum marital_status: { single: 0, married: 1, midowed: 2, divorced: 3, separated: 4 }.freeze, _default: 0
  enum gender: { male: 'M', female: 'F' }.freeze
  enum status: { inactive: 0, active: 1, rest: 2 }.freeze, _default: 0

  validates :first_name, :familly_name, presence: true, length: { maximum: 11 }
  validates :phone, uniqueness: true, length: { within: 10..16 }, allow_blank: true
  validates :agreed_to_terms, presence: true, inclusion: { in: [true, false] }

  # validates :data, presence: true, length: { maximum: 9 }
  # validates :address, presence: true, length: { maximum: 4 }

  private

  def set_default_role
    self.role = Role.find_or_create_by(name: 'guest') if role.nil?
  end

  def admin?
    role.name == 'admin'
  end
  
  def generate_matricule_number
    self.matricule_number = SecureRandom.random_number(10**8).to_s.rjust(8, '0')
  end
end
