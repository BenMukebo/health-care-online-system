class Contract < ApplicationRecord
  belongs_to :organization # , dependent: :destroy
  belongs_to :hospital # , dependent: :destroy

  validates_presence_of :start_date, :end_date, :agreement_type, :status
  validates_inclusion_of :renewal_option, in: [true, false], allow_blank: true
  # validates :terms_of_agreement, presence: true, length: { maximum: 5 }

  enum :agreement_type, %i[service purchase lease licensing non_disclosure memorandum].freeze
  STATUS = %i[pending active in_review suspended expired terminated].freeze
  enum status: STATUS.freeze, _default: 'pending'
end
