# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  mount Rswag::Ui::Engine, at: 'api-docs'
  mount Rswag::Api::Engine, at: 'api-docs'
end
