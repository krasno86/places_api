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
              full_name: { type: :string },
              email: { type: :string },
              password: { type: :string },
              role: { type: :string, enum: ['white', 'red'] },
            },
            required: ['full_name', 'email', 'password']
          }
        },
        required: ['user']
      }
      produces 'application/json'

      response '200', 'Signup' do
        let(:params) { { email: 'a1@gmail.com', password: 'aa123456', password_confirmation: 'aa123456', full_name: 'afsafa' } }
        include_context 'with integration test'
      end
    end
  end
end