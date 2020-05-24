# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :companies, dependent: :destroy
  # belongs_to :city

  validates :name, presence: true, uniqueness: true
end
