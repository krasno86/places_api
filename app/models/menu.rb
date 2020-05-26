# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :company
  has_many_attached :images

  validate :image, presence: true
end
