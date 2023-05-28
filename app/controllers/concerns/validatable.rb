module Validatable
  extend ActiveSupport::Concern

  included do
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 60 }, presence: true
    validates :email, length: { maximum: 128 },
                      uniqueness: { case_sensitive: false }, allow_blank: true,
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

    validates_uniqueness_of :phone_number, :register_number, allow_blank: true
    validates_presence_of :status
    # validates :address, presence: true, length: { maximum: 5 }
    # validates :data, presence: true, length: { maximum: 9 }
  end
end
