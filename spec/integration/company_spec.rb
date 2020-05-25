# frozen_string_literal: true

require 'swagger_helper'

describe 'Places API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  path 'v1/companies_by_city' do
    get 'Show companies by city' do
      tags 'Get companies by city'
      consumes 'application/json'
      parameter name: :city_id, in: :query, type: :string, required: true
      produces 'application/json'

      response '200', 'companies found' do
        # schema type: :object,
        #        properties: {
        #          id: { type: :integer },
        #          active: { type: :boolean }
        #        },
        #        required: %w[id active]

        let(:city) { create(:city) }
        let(:category) { create(:category) }
        let(:company) { create(:company, city_id: city.id, category_id: category.id) }
        let(:company_info) { create(:company_info, company_id: company.id) }
        let(:city_id) { city.id }
        run_test!
      end

      # response '404', 'Not Found' do
      #   let(:city_id) { 0 }
      #   run_test!
      # end
    end
  end
end
