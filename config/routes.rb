# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               registration: 'signup'
             },
             controllers: {
               registrations: 'registrations'
             }

  mount Rswag::Ui::Engine, at: 'api-docs'
  mount Rswag::Api::Engine, at: 'api-docs'

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
