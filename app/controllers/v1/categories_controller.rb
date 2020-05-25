# frozen_string_literal: true

module V1
  class CategoriesController < V1::ApplicationController
    def index
      render json: CategorySerializer.new(Category.all)
    end
  end
end
