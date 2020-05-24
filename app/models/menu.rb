# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :company
  # validate :image, presence: true
end
