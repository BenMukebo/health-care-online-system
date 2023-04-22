class Contract < ApplicationRecord
  belongs_to :organization #, dependent: :destroy
  belongs_to :hospital #, dependent: :destroy
end
