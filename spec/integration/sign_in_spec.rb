# frozen_string_literal: true

require 'swagger_helper'

describe 'Places API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  let(:authorized_user) { create(:authorized_user) }
  let(:unauthorized_user) { create(:unauthorized_user) }

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
        let(:params) { { email: authorized_user.email, password: authorized_user.password } }
        run_test!
      end

      response '401', 'Signin' do
        let(:params) { { email: unauthorized_user.email, password: unauthorized_user.password } }
        run_test!
      end
    end
  end
end
