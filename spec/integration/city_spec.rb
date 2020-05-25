# frozen_string_literal: true

require 'swagger_helper'

describe 'Places API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  path 'v1/cities' do
    get 'Show all cities' do
      tags 'Get all cities'
      produces 'application/json'

      response '200', 'companies found' do
        before { create_list(:city, 2) }
        # schema type: :object,
        #        properties: {
        #          id: { type: :integer },
        #          name: { type: :string }
        #        },
        #        required: %w[id name]
        run_test!
      end
    end
  end
end
