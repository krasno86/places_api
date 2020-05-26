# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: 'Category' do
    name { Faker::Company.industry }
  end
end
