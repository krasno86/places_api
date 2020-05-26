# frozen_string_literal: true

class CompanyInfo < ApplicationRecord
  belongs_to :company
  has_many_attached :images

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
