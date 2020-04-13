# frozen_string_literal: true

class User < ApplicationRecord
  # has_secure_password

  # devise :database_authenticatable, :registerable, :confirmable

  validates :username, presence: true, uniqueness: true

  has_many :companies, dependent: :destroy
end
