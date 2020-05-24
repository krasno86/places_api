# frozen_string_literal: true

class CompanyInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description

  belongs_to :company
end
