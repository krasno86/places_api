# frozen_string_literal: true

class City < ApplicationRecord
  has_many :companies, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
