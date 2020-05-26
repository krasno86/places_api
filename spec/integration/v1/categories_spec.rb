# frozen_string_literal: true

require 'swagger_helper'

describe 'Places API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  path 'v1/categories' do
    get 'Show all categories' do
      tags 'Categories'
      produces 'application/json'

      response '200', 'categories found' do
        before { create_list(:category, 2) }
        examples 'application/json' => {
          id: 1,
          type: 'category',
          attributes: {
            name: 'Паб'
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
