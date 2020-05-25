# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :companies, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
