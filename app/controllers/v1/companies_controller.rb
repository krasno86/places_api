# frozen_string_literal: true

module V1
  class CompaniesController < ApplicationController
    def index
      render json: CompanySerializer.new(Company.all)
    end

    def companies_by_city
      city = City.find(params[:city_id])
      render json: CompanySerializer.new(city.companies, include: [:company_info])
    end

    def companies_by_category
      category = Category.find(params[:category_id])
      render json: CompanySerializer.new(category.companies, include: [:company_info])
    end
  end
end
