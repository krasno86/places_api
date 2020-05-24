# frozen_string_literal: true

class CompanyComment < ApplicationRecord
  belongs_to :company
  validates :username, presence: true
  validates :message, presence: true
end
