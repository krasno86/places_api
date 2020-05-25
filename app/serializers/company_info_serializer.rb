# frozen_string_literal: true

class CompanyInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :address, :latitude, :longitude, :work_time_description

  belongs_to :company
end
