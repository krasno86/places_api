# frozen_string_literal: true

module V1
  class CompaniesController < ApplicationController
    def index
      render json: CompanySerializer.new(City.all)
    end

    def companies_by_city
      city = City.find(params[:city_id])
      render json: CompanySerializer.new(city.companies)
    end

    def companies_by_category
      category = Category.find(params[:category_id])
      render json: CompanySerializer.new(category.companies)
    end
  end
end
