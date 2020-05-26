# frozen_string_literal: true

FactoryBot.define do
  factory :company, class: 'Company' do
    association :user, factory: :user
    association :category, factory: :category
    association :city, factory: :city, strategy: :find_or_create

    active { true }
  end
end
