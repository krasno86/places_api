class CompanyImage < ApplicationRecord
  belongs_to :company
  # validate :image, presence: true
end
