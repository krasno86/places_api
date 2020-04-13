# frozen_string_literal: true

class SigninController < ApplicationController
  # before_action :authorize_access_request!, only: [:destroy]

  def create
    binding.pry
    user = User.find_by!(email: params[:email])
    if user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      not_authorized
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end

  private

  def not_found
    render json: { error: 'Cannont find such email/password combination' }, status: :not_found
  end
end
