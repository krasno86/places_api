# frozen_string_literal: true

class CompanyTable < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
end
