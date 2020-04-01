# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'signin', to: 'signin#create'
  post 'signup', to: 'signup#create'
  delete 'signin', to: 'signup#destroy'
end
