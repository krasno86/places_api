# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine, at: 'api-docs'
  mount Rswag::Api::Engine, at: 'api-docs'
end
