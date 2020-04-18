class CompanyComment < ApplicationRecord
  belongs_to :company
  validates :username, presence: true
  validates :message, presence: true
end
