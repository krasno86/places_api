# frozen_string_literal: true

module V1
  class CitiesController < ApplicationController
    def index
      render json: CitySerializer.new(City.all)
    end
  end
end
