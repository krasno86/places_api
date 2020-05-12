class City < ApplicationRecord
  has_many :companies, dependent: :destroy
  # has_many :categories, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
