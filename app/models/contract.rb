class Contract < ApplicationRecord
  belongs_to :organization
  belongs_to :hospital

  # has_one_attached :avatar
  has_many_attached :legal_documents
  has_rich_text :body

  validates_presence_of :start_date, :end_date, :agreement_type, :status
  validates_inclusion_of :renewal_option, in: [true, false], allow_blank: true
  # validates :terms_of_agreement, presence: true, length: { maximum: 5 }

  enum :agreement_type, %i[service purchase lease licensing non_disclosure memorandum].freeze
  STATUS = %i[pending active in_review suspended expired terminated].freeze
  enum status: STATUS.freeze, _default: 'pending'
end
