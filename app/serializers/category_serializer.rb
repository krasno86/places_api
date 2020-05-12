# frozen_string_literal: true

class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  belongs_to :city
end
