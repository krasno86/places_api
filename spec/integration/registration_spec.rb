# frozen_string_literal: true

require 'swagger_helper'

describe 'Places API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  path '/signup' do
    post 'Create new user' do
      tags 'Registration'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string },
              role: { type: :string, enum: %w[white red] }
            },
            required: %w[username email password]
          }
        },
        required: ['user']
      }
      produces 'application/json'

      response '200', 'Signup' do
        let(:params) { { email: 'a1@gmail.com', password: 'aa123456', password_confirmation: 'aa123456', username: 'afsafa' } }
        # include_context 'with integration test'
        run_test!
      end

      response '400', 'invalid request' do
        let(:params) { { email: 'a1@gmail.com' } }
        run_test!
      end
    end
  end
end
