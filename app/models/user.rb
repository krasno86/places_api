# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  validates :username, presence: true, uniqueness: true

  has_many :companies, dependent: :destroy

  def jwt_payload
    { foo: 'bar' }
  end
end
