# frozen_string_literal: true

class CitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  has_many :categories
end
