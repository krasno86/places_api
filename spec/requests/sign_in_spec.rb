# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sessions', type: :request do
  let(:user) { create(:authorized_user) }
  let(:unauthorized_user) { create(:unauthorized_user) }

  describe 'POST #create' do
    context 'with not verified user' do
      before { post '/auth/sign_in', params: { email: unauthorized_user.email, password: unauthorized_user.password } }
      it { expect(response).to have_http_status 401 }
    end

    context 'when sign_in' do
      before do
        post '/auth/sign_in',
             params: { email: user.email, password: user.password },
             headers: user.create_new_auth_token
      end

      it 'with valid params' do
        expect(response).to have_http_status 200
        expect(response.has_header?('access-token')).to eq(true)
      end
    end
  end

  describe 'sign_out' do
    let!(:user) { create(:user) }

    before { delete '/auth/sign_out', headers: user.create_new_auth_token }

    it { expect(response).to have_http_status 200 }
  end
end
