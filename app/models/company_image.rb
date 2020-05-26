# frozen_string_literal: true

class CompanyImage < ApplicationRecord
  belongs_to :company
  # validate :image, presence: true
end
