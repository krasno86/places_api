# frozen_string_literal: true

class CompanySerializer
  include FastJsonapi::ObjectSerializer

  has_one :company_info
  belongs_to :city
end
