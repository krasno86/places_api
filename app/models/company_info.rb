class CompanyInfo < ApplicationRecord
  belongs_to :company
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
