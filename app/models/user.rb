class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  belongs_to :organization, optional: true
  belongs_to :hospital, optional: true
  has_many :healthcare_requests#, dependent: :destroy

  has_one_attached :image
  # has_many_attached :documents
  # has_rich_text :biography

  after_initialize :set_default_role, if: :new_record?
  before_create :generate_matricule_number, unless: -> { matricule_number.present? }
  # before_validation :generate_matricule_number, on: :create

  # enum :marital_status, %i[single married midowed divorced separated].freeze
  enum marital_status: { single: 0, married: 1, midowed: 2, divorced: 3, separated: 4 }.freeze, _default: 0
  enum gender: { Male: 'M', Female: 'F' }.freeze
  enum status: { inactive: 0, active: 1, rest: 2 }.freeze, _default: 0

  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :first_name, :familly_name, presence: true, length: { maximum: 11 }
  # validates :password, presence: true, on: :create
  # validates :password, length: { in: 6..128 }, on: :update, allow_blank: true
  validates :phone, uniqueness: true, length: { within: 10..16 }
  validates :agreed_to_terms, presence: true, inclusion: { in: [true, false] }
  # validates :address, presence: true, length: { maximum: 5 }
  # validates :data, presence: true, length: { maximum: 9 }

  def admin?
    role.name == 'admin'
  end

  def super_admin?
    role.name == 'super_admin'
  end

  private

  def set_default_role
    self.role = Role.find_or_create_by(name: 'user') if role.nil?
  end

  # def update_role(role_name)
  #   self.role = Role.find_or_create_by(name: role_name).save!
  # end

  def generate_matricule_number
    self.matricule_number = SecureRandom.random_number(10**8).to_s.rjust(8, '0')
  end
end
