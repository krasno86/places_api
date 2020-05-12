# frozen_string_literal: true

module V1
  class CategoriesController < V1::ApplicationController
    before_action :set_city

    def index
      render json: CategorySerializer.new(@city.categories)
    end

    private

    def set_city
      @city = City.find(params[:city_id])
    end
  end
end
