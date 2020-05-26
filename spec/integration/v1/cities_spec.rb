# frozen_string_literal: true

require 'swagger_helper'

describe 'Places API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  path 'v1/cities' do
    get 'Show all cities' do
      tags 'Cities'
      produces 'application/json'

      response '200', 'cities found' do
        before { create_list(:city, 2) }
        examples 'application/json' => {
          id: 1,
          type: 'city',
          attributes: {
            name: 'Запорожье'
          },
          relationships: {
            companies: {
              data: [
                {
                  id: '1',
                  type: 'company'
                }
              ]
            }
          }
        }
        run_test!
      end
    end
  end
end
