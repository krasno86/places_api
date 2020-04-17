# frozen_string_literal: true

require 'swagger_helper'

describe 'Places API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  path 'auth/sign_in' do
    post 'Login user' do
      tags 'Login'
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
              role: { type: :string, enum: %w[user admin] }
            },
            required: %w[email password]
          }
        },
        required: ['user']
      }
      produces 'application/json'

      response '200', 'Signin' do
        let(:params) { { email: 'a1@gmail.com', password: 'aa123456' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:params) { { email: 'a1@gmail.com' } }
        run_test!
      end
    end
  end
end
